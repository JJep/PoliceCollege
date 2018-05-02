//
//  BookDetailViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "BookDetailViewController.h"
#import "BookIntroductionTableViewCell.h"
#import "BookModel.h"
#import "BookTableViewCell.h"
#import "CommentTableViewCell.h"
@interface BookDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,assign)int currentView;
@end



@implementation BookDetailViewController {
    UITableView *tableView;
    BookModel *bookModel;
    CommentTableViewCell *commentCell;
}

static const int introductionView = 12;
static const int commentView = 13;
static const int introductionButtonTag = 123;
static const int commentButtonTag = 1234;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"图书详情";
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.estimatedRowHeight = 205;
    tableView.rowHeight = UITableViewAutomaticDimension;
    
    _currentView = introductionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else {
        return bookModel.bookChapters.count;
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
        cell = [[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookCell"];
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
        return cell;

    } else {
        switch (_currentView) {
            case commentView:
            {
                CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
                cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"commentCell"];
                return cell;
            }
            case introductionView:
            {
                if (indexPath.section == 1) {
                    BookIntroductionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introductionCell"];
                    cell = [[BookIntroductionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"introductionCell"];
                    [cell setContent:bookModel.bookIntroduction];
                    return cell;
                } else {
                    BookIntroductionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chapterCell"];
                    cell = [[BookIntroductionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"chapterCell"];
                    [cell setContent:bookModel.bookChapters[indexPath.row]];
                    return cell;
                }
            }
            default:
            {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
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

//- (void)setCurrentView:(int)currentView {
//    if (_currentView != currentView) {
//        _currentView = currentView;
//        [tableView reloadData];
//    }
//}

@end
