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
@interface BookDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,assign)int currentView;
@end

@implementation BookDetailViewController {
    UITableView *tableView;
    PCChapterViewModel *chapterViewModel;
    CommentTableViewCell *commentCell;
    NSArray *chapterArray;
}

static const int introductionView = 12;
static const int commentView = 13;
static const int introductionButtonTag = 123;
static const int commentButtonTag = 1234;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self getData];
}

- (void)getData {
    [chapterViewModel getChapterListWithBookIDAction:[NSNumber numberWithInteger:self.model.idField] success:^(id responseObject) {
        if ([[responseObject objectForKey:@"state"] isEqualToString:@"1"] ) {
            self->chapterArray = [NSArray yy_modelArrayWithClass:[Chapter class] json:[responseObject objectForKey:@"sectionList"]];
            [self->tableView reloadData];
        }
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
    
    chapterViewModel = [PCChapterViewModel new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
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
        default:
            break;
    }
}
@end
