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
@interface PersonViewController ()

@end

@implementation PersonViewController {
    SeasonRank *seasonRankView;
    SelectedCoursesView *selectedCoursesView;
    SelectedCoursesView *selectedVideoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    [self.navigationController pushViewController:newVC animated:true];
}

@end
