//
//  PersonViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/27.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PersonViewController.h"
#import "SeasonRank.h"
#import "SelectedCoursesView.h"
#import "PersonMoreViewController.h"
#import "PersonCenterViewModel.h"
#import "Situation.h"
#import "CourseOverview.h"
#import "VideoOverview.h"
#import "Overview.h"
@interface PersonViewController ()

@end

@implementation PersonViewController {
    SeasonRank *seasonRankView;
    SelectedCoursesView *selectedCoursesView;
    SelectedCoursesView *selectedVideoView;
    PersonCenterViewModel *personCenterViewModel;
    NSUInteger myRanking;
    Situation *currentSeasonSituation;
    VideoOverview *videoOverview;
    CourseOverview *courseOverview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViews];
    [self initData];
    [self downloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self downloadData];
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

        id overview = [responseObject objectForKey:@"overview"];
        self->courseOverview = [CourseOverview yy_modelWithJSON:[overview objectForKey:@"course"]];
        self->videoOverview = [VideoOverview yy_modelWithJSON:[overview objectForKey:@"video"]];
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
    
    
}

- (void)updateUI {
    [seasonRankView.rankLabel setText:[NSString stringWithFormat:@"%lu", myRanking]];
    [seasonRankView setModel:currentSeasonSituation];
    [selectedCoursesView setModel:courseOverview withStyle:OverviewCourseStyle];
    [selectedVideoView setModel:videoOverview withStyle:OverviewVideoStyle];
}

- (void)initData {
    personCenterViewModel = [PersonCenterViewModel new];
}

- (void)initViews {
    
    self.title = @"个人中心";
    
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [moreButton setTitle:@"更多" forState:UIControlStateNormal];
    [moreButton setTitleColor:rgba(181,181,181,1) forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:moreButton];
    self.navigationItem.rightBarButtonItem = rightButton;
    [self.view setBackgroundColor:rgb(244, 244, 249)];
    
    seasonRankView = [SeasonRank new];
    selectedCoursesView = [SelectedCoursesView new];
    selectedVideoView = [SelectedCoursesView new];
    
    [selectedVideoView.selectedCoursesTitleLabel setText:@"已选视频"];
    [self.view addSubview:selectedVideoView];
    [self.view addSubview:selectedCoursesView];
    [self.view addSubview:seasonRankView];
    
    [seasonRankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(self.view).offset(15);
        make.height.mas_equalTo(170);
    }];
    
    [selectedCoursesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->seasonRankView.mas_bottom).offset(20);
        make.left.right.equalTo(self->seasonRankView);
        make.height.mas_equalTo(130);
    }];
    
    [selectedVideoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->selectedCoursesView);
        make.top.equalTo(self->selectedCoursesView.mas_bottom).offset(15);
        make.height.mas_equalTo(130);
    }];
}

- (void)didTouchBtn:(UIButton *)button {
    PersonMoreViewController *newVC = [PersonMoreViewController new];
    newVC.hidesBottomBarWhenPushed = true;
    newVC.currentSeasonSituation = currentSeasonSituation;
    newVC.myRanking = myRanking;
    [self.navigationController pushViewController:newVC animated:true];
}

@end
