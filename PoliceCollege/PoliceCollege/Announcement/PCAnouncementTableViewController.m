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
#import "AnnouncementDataSource.h"
#import "AnouncementTableViewCell+ConfigureForAnnouncement.h"
static NSString * const cellIdentifier = @"announcementCell";

@interface PCAnouncementTableViewController () <UITableViewDelegate>
@property (nonatomic, retain)AnnouncementDataSource *annoucementDataSource;
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
    
    AnnouncementTableViewCellConfigureBlock configureCell = ^(AnouncementTableViewCell *cell, PCAnnouncementModel *announcement) {
        [cell configureForAnnoucement:announcement];
    };
    self.annoucementDataSource = [[AnnouncementDataSource alloc] initWithItems:promotionArray cellIdentifier:cellIdentifier configureCellBlock:configureCell];
    
    tableView.dataSource = self.annoucementDataSource;
    
    [tableView registerClass:[AnouncementTableViewCell class] forCellReuseIdentifier:cellIdentifier];

}

- (void)updateUI {
    [self.annoucementDataSource updateWithItems:promotionArray];
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
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:false animated:animated];
}
@end
