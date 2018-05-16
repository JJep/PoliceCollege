//
//  BookDetailViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "BookDetailViewController.h"
#import "BookIntroductionTableViewCell.h"
#import "PCChapterViewModel.h"
#import "BookTableViewCell.h"
#import "CommentTableViewCell.h"
#import "Chapter.h"
#import "ChapterTableViewCell.h"
#import "PCBookViewModel.h"
#import "Comment.h"
#import "LSYReadPageViewController.h"
@interface BookDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,assign)int currentView;
@end

@implementation BookDetailViewController {
    UITableView *tableView;
    PCChapterViewModel *chapterViewModel;
    CommentTableViewCell *commentCell;
    NSArray *chapterArray;
    NSMutableArray *commentArray;
    PCBookViewModel *bookViewModel;
    NSInteger currentPage;
    NSInteger totalPage;
    NSString *documentsDirectory;
    NSString *fileName;
}

static const int introductionView = 12;
static const int commentView = 13;
static const int introductionButtonTag = 123;
static const int commentButtonTag = 1234;
static const int readButtonTag = 12345;
static const int downloadButtonTag = 123456;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self initData];
    [self getData];
}

- (void)downloadBook {
    [bookViewModel downloadBookWithBookID:[NSNumber numberWithInteger:self.model.idField] success:^(id responseObject) {
        self.model = [Book yy_modelWithJSON:[responseObject objectForKey:@"book"]];
        NSLog(@"%@",self.model.sections);
        self->chapterArray = [NSArray yy_modelArrayWithClass:[Chapter class] json:self.model.sections];
        NSMutableString *fileString = [NSMutableString stringWithFormat:@"%@\n",self.model.title];

        if ([self createFile:self->documentsDirectory fileName:self->fileName]) {
            NSLog(@"文件创建成功");
            [self->chapterArray enumerateObjectsUsingBlock:^(Chapter* chapter, NSUInteger idx, BOOL * _Nonnull stop) {
                [fileString appendString:[NSString stringWithFormat:@"%@\n",chapter.content]];
                if (idx == self->chapterArray.count-1) {
                    NSLog(@"文本字符串创建完成");
                    if ([self writeFile:self->documentsDirectory fileString:fileString  fileName:self->fileName]) {
                        NSLog(@"文本写入成功");
                        [SVProgressHUD showErrorWithStatus:@"文件写入失败"];
                    } else {
                        [SVProgressHUD showErrorWithStatus:@"文件写入失败"];
                        NSLog(@"文本写入失败");
                    }
                    
                }
            }];
        } else {
            NSLog(@"文件创建失败");
        }
        
        
    } fail:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"下载失败"];
    }];
}

- (void)getData {
    [chapterViewModel getChapterListWithBookIDAction:[NSNumber numberWithInteger:self.model.idField] success:^(id responseObject) {
        if ([[responseObject objectForKey:@"state"] isEqualToString:@"1"] ) {
            self->chapterArray = [NSArray yy_modelArrayWithClass:[Chapter class] json:[responseObject objectForKey:@"sectionList"]];
            [self->tableView reloadData];
        }
    } fail:^(NSError *error) {
        
    }];
    
    [bookViewModel getBookCommentListActionWithBookID:[NSNumber numberWithInteger:self.model.idField] currentPage:[NSNumber numberWithInteger:currentPage] success:^(id responseObject) {
        NSArray *ary =  [NSArray yy_modelArrayWithClass:[Comment class] json:[responseObject objectForKey:@"commentList"]];
        [self->commentArray addObjectsFromArray:ary];
        [self->tableView reloadData];
    } fail:^(NSError *error) {
        
    }];
    
}

- (void)initViews {
    self.title = @"图书详情";
    
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.estimatedRowHeight = 205;
    tableView.rowHeight = UITableViewAutomaticDimension;
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [tableView registerClass:[BookTableViewCell class] forCellReuseIdentifier:@"bookCell"];
    [tableView registerClass:[CommentTableViewCell class] forCellReuseIdentifier:@"commentCell"];
    [tableView registerClass:[BookIntroductionTableViewCell class] forCellReuseIdentifier:@"introductionCell"];
    [tableView registerClass:[ChapterTableViewCell class] forCellReuseIdentifier:@"chapterCell"];
    _currentView = introductionView;
}

- (void)initData {
    chapterViewModel = [PCChapterViewModel new];
    commentArray = [NSMutableArray new];
    bookViewModel = [PCBookViewModel new];
    currentPage = 1;
    
    fileName = [NSString stringWithFormat:@"%@.txt",self.model.title];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        if (_currentView == introductionView) {
            return 1;
        } else {
            return commentArray.count;
        }
        return 1;
    } else {
        return chapterArray.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    switch (_currentView) {
        case introductionView:
            return 3;
        case commentView:
            return 2;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookCell"];
        [cell.introductionBtn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
        [cell.commentBtn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
        [cell.readBtn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
        [cell.downloadBtn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
        [cell.readBtn setTag: readButtonTag];
        [cell.downloadBtn setTag:downloadButtonTag];
        [cell.introductionBtn setTag:introductionButtonTag];
        [cell.commentBtn setTag:commentButtonTag];
        [cell.introductionBtn setSelected:true];
        [cell.commentBtn setSelected:false];
        if (_currentView == introductionView) {
            [cell.rightView setHidden:true];
            [cell.leftView setHidden:false];
            [cell.introductionBtn setSelected:true];
            [cell.commentBtn setSelected:false];
        } else {
            [cell.leftView setHidden:true];
            [cell.rightView setHidden:false];
            [cell.commentBtn setSelected:true];
            [cell.introductionBtn setSelected:false];
        }
        [cell setModel:self.model];
        return cell;

    } else {
        switch (_currentView) {
            case commentView:
            {
                CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
                [cell setModel:commentArray[indexPath.row]];
                return cell;
            }
            case introductionView:
            {
                if (indexPath.section == 1) {
                    BookIntroductionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introductionCell"];
                    [cell setContent:self.model.content];
                    return cell;
                } else {
                    ChapterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chapterCell"];
                    [cell setModel:chapterArray[indexPath.row]];
                    return cell;
                }
            }
            default:
            {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
                return cell;
            }
        }
        
    }
}

- (void)didTouchBtn:(UIButton *)button {
    long tag = button.tag;
    switch (tag) {
        case introductionButtonTag:
            _currentView = introductionView;
            [tableView reloadData];
            break;
        case commentButtonTag:
            _currentView = commentView;
            [tableView reloadData];
            break;
        case readButtonTag:
            [self pushToReadBook];
            break;
        case downloadButtonTag:
            [SVProgressHUD showWithStatus:@"开始下载"];
            [self downloadBook];
            break;
        default:
            break;
    }
}

- (void)pushToReadBook {
    LSYReadPageViewController *pageView = [[LSYReadPageViewController alloc] init];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:[self getLocalFilePath:fileName]];
    pageView.resourceURL = fileURL;    //文件位置
    pageView.model = [LSYReadModel getLocalModelWithURL:fileURL];  //阅读模型
    [self presentViewController:pageView animated:YES completion:nil];
}

- (NSString *)getLocalFilePath:(NSString *) fileName
{
    NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents"];
    return [NSString stringWithFormat:@"%@/%@",path,fileName];
}


-(BOOL)createFile:(NSString *)path fileName:(NSString *)fileName{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [path stringByAppendingPathComponent:fileName];//在传入的路径下创建文件
    BOOL res=[fileManager createFileAtPath:testPath contents:nil attributes:nil];
    //通过data创建数据
    return res;
}

-(BOOL)writeFile:(NSString *)path fileString:(NSString *)fileString fileName:(NSString *)fileName{
    NSString *testPath = [path stringByAppendingPathComponent:fileName];
    BOOL res=[fileString writeToFile:testPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    return res;
}

@end
