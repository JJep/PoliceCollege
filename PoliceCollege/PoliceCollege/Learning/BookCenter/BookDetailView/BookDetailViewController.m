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
#import "CommentViewController.h"
#import "CommentViewModel.h"
#import "SendCommentView.h"

@interface BookDetailViewController () <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>
@property (nonatomic,assign)int currentView;
@end

@implementation BookDetailViewController {
    UITableView *tableView;
    PCChapterViewModel *chapterViewModel;
    CommentTableViewCell *commentCell;
    NSArray *chapterArray;
    NSMutableArray *commentArray;
    PCBookViewModel *bookViewModel;
    NSInteger currentCommentPage;
    NSInteger totalPage;
    NSString *documentsDirectory;
    NSString *fileName;
    UIButton *commentButton;
    SendCommentView *sendCommentView;
    CommentViewModel *commentViewModel;
}

static const int introductionView = 12;
static const int commentView = 13;
static const int introductionButtonTag = 123;
static const int commentViewButtonTag = 1234;
static const int readButtonTag = 12345;
static const int downloadButtonTag = 123456;
static const int commentButtonTag = 333321;
//1-成功，2-参数问题，3-已评论，4-未完成学习
static const int commentSuccessStatus = 1;
static const int commentParaErrStatus = 2;
static const int commentCommentedErrStatus = 3;
static const int commentLearningCompletionErrStatus = 4;
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
                [fileString appendString:[NSString stringWithFormat:@"第%lu章 %@\n",++idx, chapter.content]];
                if (idx == self->chapterArray.count-1) {
                    NSLog(@"文本字符串创建完成");
                    if ([self writeFile:self->documentsDirectory fileString:fileString  fileName:self->fileName]) {
                        NSLog(@"文本写入成功");
                        [SVProgressHUD showSuccessWithStatus:@"文件写入成功"];
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

- (void)downloadCommentList {
    
    [commentViewModel downloadCommentListActionWithBookID:[NSNumber numberWithInteger:self.model.idField] currentPage:[NSNumber numberWithInteger:currentCommentPage] success:^(id responseObject) {
        NSArray *ary =  [NSArray yy_modelArrayWithClass:[Comment class] json:[responseObject objectForKey:@"commentList"]];
        [self->commentArray addObjectsFromArray:ary];
        [self->tableView reloadData];
    } fail:^(NSError *error) {
        
    }];
}

- (void)downloadChapterList {
    [chapterViewModel getChapterListWithBookIDAction:[NSNumber numberWithInteger:self.model.idField] success:^(id responseObject) {
        if ([[responseObject objectForKey:@"state"] isEqualToString:@"1"] ) {
            self->chapterArray = [NSArray yy_modelArrayWithClass:[Chapter class] json:[responseObject objectForKey:@"sectionList"]];
            [self->tableView reloadData];
        }
    } fail:^(NSError *error) {
        
    }];
}

- (void)getData {

    [self downloadChapterList];
    [self downloadCommentList];
}

- (void)uploadComment {
    
    if (sendCommentView.textView.text.length >= 200) {
        
        [commentViewModel uploadCommentWithBookID:[NSNumber numberWithInteger:self.model.idField] commentContent:sendCommentView.textView.text success:^(id responseObject) {
            NSInteger status = [[responseObject objectForKey:@"status"] integerValue];
            switch (status) {
                case commentSuccessStatus:
                {
                    [SVProgressHUD showWithStatus:@"评论成功"];
                    self->currentCommentPage = 1;
                    [self downloadCommentList];
                    break;
                }
                case commentParaErrStatus:
                {
                    [SVProgressHUD showErrorWithStatus:@"参数错误,请重试"];
                break;
                }
                case commentCommentedErrStatus:
                {
                    [SVProgressHUD showErrorWithStatus:@"你已经评论过啦"];
                    break;
                }
                case commentLearningCompletionErrStatus:
                {
                    [SVProgressHUD showErrorWithStatus:@"学习未完成无法评论"];
                    break;
                }
                default:
                    break;
            }
        } fail:^(NSError *error) {
            
        }];
    } else {
        [SVProgressHUD showWithStatus:@"评论字数必须大于200字"];
    }
    
   
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
    
    commentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:commentButton];
    [commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self->tableView.mas_bottom);
    }];
    [commentButton setTitle:@"评论" forState:UIControlStateNormal];
    [commentButton addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [commentButton setTag:commentButtonTag];
    [commentButton setHidden:true];
    UIImage *image = [UIImage imageNamed:@"comment"];
    image = [self scaleToSize:image size:CGSizeMake(15, 15)];
    [commentButton setImage:image forState:UIControlStateNormal];
    sendCommentView = [SendCommentView new];
    [self.view addSubview:sendCommentView];
    sendCommentView.textView.delegate = self;
    [sendCommentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(180);
    }];
    [sendCommentView.commentButton addTarget:self action:@selector(uploadComment) forControlEvents:UIControlEventTouchUpInside];
    
    //注册键盘弹出通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

//图片缩放到指定大小尺寸
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

- (void)initData {
    chapterViewModel = [PCChapterViewModel new];
    commentArray = [NSMutableArray new];
    bookViewModel = [PCBookViewModel new];
    commentViewModel = [CommentViewModel new];
    currentCommentPage = 1;
    
    fileName = [NSString stringWithFormat:@"%@.txt",self.model.title];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0];
    
}

- (void)updateUI {
    switch (_currentView) {
        case commentView:
        {
            [tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.top.right.equalTo(self.view);
                make.bottom.equalTo(self.view).offset(-50);
            }];
            [commentButton setHidden:NO];
            break;
        }
        case introductionView:
        {
            [tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.view);
            }];
            [commentButton setHidden:true];
            break;
        }
        default:
            break;
    }
    [tableView reloadData];
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
        [cell.commentBtn setTag:commentViewButtonTag];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [sendCommentView.textView resignFirstResponder];
}


- (void)didTouchBtn:(UIButton *)button {
    long tag = button.tag;
    switch (tag) {
        case introductionButtonTag:
            _currentView = introductionView;
            [self updateUI];
            break;
        case commentViewButtonTag:
            _currentView = commentView;
            [self updateUI];
            break;
        case readButtonTag:
            [self pushToReadBook];
            break;
        case downloadButtonTag:
            [SVProgressHUD showWithStatus:@"开始下载"];
            [self downloadBook];
            break;
        case commentButtonTag: {
            [commentButton setHidden:true];
            [sendCommentView.textView becomeFirstResponder];
            
            break;
        }
        default:
            break;
    }
}

//键盘弹出后将视图向上移动

-(void)keyboardWillShow:(NSNotification *)note

{
    
    NSDictionary *info = [note userInfo];
    
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    //目标视图UITextField
    
    CGRect frame = sendCommentView.frame;
    
    int y = frame.size.height + keyboardSize.height;
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeView" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    if(y > 0)
        
    {
        
        self.view.frame = CGRectMake(0, -y+self.navigationController.navigationBar.bounds.size.height, self.view.frame.size.width, self.view.frame.size.height);
        
    }
    
    [UIView commitAnimations];
    
}
//键盘隐藏后将视图恢复到原始状态

-(void)keyboardWillHide:(NSNotification *)note

{
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeView" context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    self.view.frame =CGRectMake(0, self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.bounds.size.height, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
    [self updateUI];
}

- (void)pushToReadBook {
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:[self getLocalFilePath:fileName]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self getLocalFilePath:fileName]]) {
//        if (!hasNetWork) {
//            UIAlertView *alertView = [[UIAlertView alloc]init];
//            [alertView setTitle:@"您当前无网络,请查看离线书籍"];
//            [alertView addButtonWithTitle:@"确定"];
//            [alertView show];
//            return;
//        }else
//        if (self.book.contentType == SRBookContentType_Epub3){
            UIAlertView *alertView = [[UIAlertView alloc]init];
            [alertView setTitle:@"当前书籍需要先下载才能查看,是否下载书籍"];
            [alertView addButtonWithTitle:@"取消"];
            [alertView addButtonWithTitle:@"确定"];
        [alertView show];
//            [alertView showAlertViewWithCompleteBlock:^(NSInteger buttonIndex) {
//                if (buttonIndex == 1) {
//                    [self comfirmButtonClick];
//                }
//            }];
            return;
//        }
    }

    LSYReadPageViewController *pageView = [[LSYReadPageViewController alloc] init];

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
