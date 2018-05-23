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
#import "ThemeViewModel.h"
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
    ThemeViewModel *themeViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
    
    viewModel = [[PCAnouncementListViewModel alloc] init];
    themeViewModel = [[ThemeViewModel alloc] init];
    promotionArray = [[NSMutableArray alloc] init];
    
    [self downloadData];
    
}

- (void)initViews {
    if (self.isTheme) {
        self.title = @"专题中心";
    } else {
        self.title = @"通知公告";
    }
    
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

- (void)downloadData {
    if (self.isTheme) {
        [self getFirstThemeList];
    } else {
        [self getFirstAnnouncementList];
    }
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

- (void)getFirstThemeList {
    [themeViewModel downloadThemeListWithCurrentPage:@1 success:^(id responseObject) {
        totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[PCAnnouncementModel class] json:[responseObject objectForKey:@"newsList"]];
        [self->promotionArray addObjectsFromArray:modelArray];
        currentPage = 2;
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
}

- (void)downloadMoreThemeList {
    [themeViewModel downloadThemeListWithCurrentPage:[NSNumber numberWithInt:currentPage] success:^(id responseObject) {
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

- (void)getFirstAnnouncementList {
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

- (void)downloadMoreAnnouncementLista {
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

- (void)getMoreList {
    if (self.isTheme) {
        [self downloadMoreThemeList];
    } else {
        [self downloadMoreAnnouncementLista];
    }
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
