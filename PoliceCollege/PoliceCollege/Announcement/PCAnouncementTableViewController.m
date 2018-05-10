//
//  PCAnouncementTableViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCAnouncementTableViewController.h"
#import "AnouncementTableViewCell.h"
#import "PCAnnouncementDetailViewController.h"
#import "PCAnnouncementModel.h"
#import "PCAnouncementListViewModel.h"
#import "BackView.h"
#import <MJRefresh.h>
@interface PCAnouncementTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end
int currentPage ;
int totalPage ;
@implementation PCAnouncementTableViewController {
    UITableView *tableView;
    PCAnouncementListViewModel *viewModel;
    NSMutableArray *promotionArray;
    BackView *backView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initViews];
    
    viewModel = [PCAnouncementListViewModel new];
    promotionArray = [NSMutableArray new];
    [self getFirstList];
    
}

- (void)initViews {
    self.title = @"通知公告";
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    
    backView = [[BackView alloc] initWithFrame:self.view.bounds];
    [backView setImage:[UIImage imageNamed:@"announcementBackIcon"]];
    [backView setName:@"暂无通知公告"];
    [self.view addSubview:backView];
    
    tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self getMoreList];
    }];
    [backView addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    currentPage = 1;
    totalPage = 1;
    
    //没有数据的时候显示背景图
    [tableView setHidden:true];

}

- (void)updateUI {
    if (promotionArray.count == 0) {
        [tableView setHidden:true];
    } else {
        [tableView setHidden:false];
    }
    [tableView reloadData];
}

- (void)getFirstList {
    [viewModel getFirstPromotionListAction:^(id responseObject) {
        if ([[responseObject objectForKey:@"state"] isEqualToString:@"1"]) {
            totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
            NSArray *modelArray = [NSArray yy_modelArrayWithClass:[PCAnnouncementModel class] json:[responseObject objectForKey:@"newsList"]];
            
            [self->promotionArray addObjectsFromArray:modelArray];
            currentPage = 2;
            [self updateUI];
        } else {
            NSLog(@"服务器出错");
        }
    } fail:^(NSError *error) {
        NSLog(@"网络错误");
    }];
}

- (void)getMoreList {
    [viewModel getPromotionListActionWithCurrentPage:[NSNumber numberWithInt:currentPage] success:^(id responseObject) {
        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[PCAnnouncementModel class] json:[responseObject objectForKey:@"newsList"]];
        
        [self->promotionArray addObjectsFromArray:modelArray];

        if (currentPage == totalPage) {
            [self->tableView.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self->tableView.mj_footer endRefreshing];
            currentPage ++;
        }
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
}

#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cell";
    AnouncementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[AnouncementTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    [cell setModel:promotionArray[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (promotionArray.count == 0) {
        return 0;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return promotionArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PCAnnouncementDetailViewController *VC = [PCAnnouncementDetailViewController new];
    VC.model = promotionArray[indexPath.row];
    [self.navigationController pushViewController:VC animated:true];
    AnouncementTableViewCell *cell = (AnouncementTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:false animated:animated];
}


@end
