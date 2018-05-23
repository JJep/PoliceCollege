//
//  PersonViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/27.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//
#import "BookCenterViewController.h"
#import "PersonViewController.h"
#import "SeasonRank.h"
#import "SelectedCoursesView.h"
#import "PersonMoreViewController.h"
#import "PersonCenterViewModel.h"
#import "Situation.h"
#import "CourseOverview.h"
#import "VideoOverview.h"
#import "Overview.h"
#import "PCDataSource.h"
#import "SelectedOverviewTableViewCell.h"
@interface PersonViewController () <UITableViewDelegate>

@end

static NSString * const cellID = @"overviewCell";

@implementation PersonViewController {
    UITableView *tableView;
    SeasonRank *seasonRankView;
    SelectedCoursesView *selectedCoursesView; //已选课程
    SelectedCoursesView *selectedVideoView;//已选视频
    SelectedCoursesView *selectedBookView;//已选图书
    PersonCenterViewModel *personCenterViewModel;
    NSUInteger myRanking;
    Situation *currentSeasonSituation;
    VideoOverview *videoOverview;
    CourseOverview *courseOverview;
    Overview *bookOverview;
    PCDataSource *dataSource;
    NSMutableArray *overviewArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initViews];
    [self downloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self downloadData];
}

- (void)downloadData {
    [personCenterViewModel getRankingAction:^(id responseObject) {
        self->myRanking = [[responseObject objectForKey:@"num"] unsignedIntegerValue];
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
    
    [personCenterViewModel getCurrentSeasonCreditInfoAction:^(id responseObject) {
        self->currentSeasonSituation = [Situation yy_modelWithJSON:[responseObject objectForKey:@"situation"]];
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
    
    [personCenterViewModel getLearningOverviewAction:^(id responseObject) {

        NSDictionary *overview = [responseObject objectForKey:@"overview"];
        [self->overviewArray removeAllObjects];
        [self->overviewArray addObject:[CourseOverview yy_modelWithJSON:[overview objectForKey:@"course"]]];
        [self->overviewArray addObject:[BookOverview yy_modelWithJSON:[overview objectForKey:@"book"]]];
        [self->overviewArray addObject:[VideoOverview yy_modelWithJSON:[overview objectForKey:@"video"]]];
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
    
    
}

- (void)updateUI {
    [seasonRankView.rankLabel setText:[NSString stringWithFormat:@"%lu", myRanking]];
    [seasonRankView setModel:currentSeasonSituation];
    [dataSource updateWithItems:overviewArray];
    [tableView reloadData];
}

- (void)initData {
    
    dataSource = [[PCDataSource alloc] initWithItems:overviewArray cellIdentifier:cellID configureCellBlock:^(id cell, id item) {
        [cell setModel:item];
    }];
    
    overviewArray = [[NSMutableArray alloc]
                     initWithArray:@[
                                     [[CourseOverview alloc] init],
                                     [[BookOverview alloc] init],
                                     [[VideoOverview alloc] init]
                                     ]
                     ];
    personCenterViewModel = [[PersonCenterViewModel alloc] init];
}

- (void)initNavigationBar {
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [moreButton setTitle:@"更多" forState:UIControlStateNormal];
    [moreButton setTitleColor:rgba(181,181,181,1) forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:moreButton];
    self.navigationItem.rightBarButtonItem = rightButton;
    [self.view setBackgroundColor:rgb(244, 244, 249)];
}

- (void)initViews {
    
    self.title = @"个人中心";
    
    tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [tableView setBackgroundColor:MyWhiteBackgroundColor];
    
    [self initNavigationBar];

    seasonRankView = [SeasonRank new];
    [tableView setTableHeaderView:seasonRankView];
    [tableView setTableFooterView:[[UIView alloc] init]];
    tableView.dataSource = dataSource;
    tableView.delegate = self;
    [tableView registerClass:[SelectedOverviewTableViewCell class] forCellReuseIdentifier:cellID];
    [selectedVideoView.selectedCoursesTitleLabel setText:@"已选视频"];

    [seasonRankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(self->tableView.tableHeaderView).offset(15);
        make.bottom.equalTo(self->tableView.tableHeaderView.mas_bottom);
    }];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectedOverviewTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    BookCenterViewController *bookViewController = [[BookCenterViewController alloc] init];
    bookViewController.isSelected = YES;
    [self.navigationController pushViewController:bookViewController animated:true];
    
}

- (void)didTouchBtn:(UIButton *)button {
    PersonMoreViewController *newVC = [PersonMoreViewController new];
    newVC.hidesBottomBarWhenPushed = true;
    newVC.currentSeasonSituation = currentSeasonSituation;
    newVC.myRanking = myRanking;
    [self.navigationController pushViewController:newVC animated:true];
}


@end
