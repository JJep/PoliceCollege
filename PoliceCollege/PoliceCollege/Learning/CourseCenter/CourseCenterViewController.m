//
//  BookCenterViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "CourseCenterViewController.h"
#import "ChannelCollectionViewCell.h"
#import "BookCenterTableViewCell.h"
#import "ChannelView.h"
#import "MoreChannelsViewController.h"
#import "BackView.h"
#import "Channel.h"
#import "PCCourseViewModel.h"
#import "PCChannelViewModel.h"
#import "Course.h"
#import "MyChannel.h"
#import <MJRefresh.h>
#import "DetailCourseViewController.h"
@interface CourseCenterViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@end

static const int courseType = 3;
static NSString *courseCellID = @"CourseCenterTableViewCell";
@implementation CourseCenterViewController {
    UITableView *tableView;
    ChannelView *channelView;
    ChannelCollectionViewCell *tempCell;
    BackView *backView;
    NSMutableArray *dataArray;
    PCCourseViewModel *courseViewModel;
    PCChannelViewModel *channelViewModel;
    NSMutableArray *channelsArray;
    NSMutableArray *coursesArray;
    Channel *currentChannel;
    int currentPage ;
    int totalPage ;
    MyChannel *myChannel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    [self createUI];
    [self getData];
}

- (void)initData {
    courseViewModel = [PCCourseViewModel new];
    channelViewModel = [PCChannelViewModel new];
    coursesArray = [NSMutableArray new];
    channelsArray = [NSMutableArray new];
    Channel *recommendChannel = [Channel new];
    [recommendChannel setName:@"推荐"];
    [channelsArray addObject:recommendChannel];
    currentPage = 1;
}

- (void)createUI {
    
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    self.title = @"课件中心";
    
    backView = [[BackView alloc] init];
    [backView setName:@"暂无课件"];
    [backView setImage:[UIImage imageNamed:@"courseBackIcon"]];
    [self.view addSubview:backView];
    
    tableView = [[UITableView alloc] init];
    [backView addSubview:tableView];
    tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        if ([self->currentChannel.name isEqualToString:@"推荐"]) {
            [self getMoreRecommendedCourseList];
        } else {
            [self getMoreCourselist];
        }
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setHidden:true];
    
    channelView = [[ChannelView alloc] init];
    [channelView setHidden:self.isSelected];
    [self.view addSubview:channelView];
    channelView.collectionView.delegate = self;
    channelView.collectionView.dataSource = self;
    [channelView.addButton addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //注册Cell
    [channelView.collectionView registerClass:[ChannelCollectionViewCell class] forCellWithReuseIdentifier:@"channelCell"];
    [tableView registerClass:[BookCenterTableViewCell class] forCellReuseIdentifier:courseCellID];
    
    [channelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(45);
    }];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self->channelView.mas_bottom);
    }];
    
    if (self.isSelected) {
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    } else {
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self->channelView.mas_bottom).offset(5);
        }];
    }
}

- (void)updateUI {
    if (coursesArray.count == 0) {
        [tableView setHidden:true];
    } else {
        [tableView setHidden:false];
    }
    //    [channelView.collectionView reloadData];
    [tableView reloadData];
}

- (void)getData {
    if (self.isSelected) {
        [self getCourseList];
    } else {
        [self getMyChannel];
        if (channelsArray.count == 1) {
            [self getRecommendedCourseList];
        } else {
            [self getCourseList];
        }
    }
}

- (void)getMoreCourselist {
    
    [courseViewModel afGetCourseListWithTypeID:[NSNumber numberWithInteger:currentChannel.idField] currentPage:[NSNumber numberWithInt:currentPage] success:^(id responseObject) {
        NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Course class] json:[responseObject objectForKey:@"courseList"]];
        [self->coursesArray addObjectsFromArray:tempAry];
        self->totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
        if (self->currentPage == self->totalPage) {
            [self->tableView.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self->tableView.mj_footer endRefreshing];
            self->currentPage ++;
        }
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
    
}

- (void)getCourseList {
    if (self.isSelected) {
        [courseViewModel downloadSelectedCourseWithCurrentPage:[NSNumber numberWithInt:1] success:^(id responseObject) {
            [self->coursesArray removeAllObjects];
            NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Course class] json:[responseObject objectForKey:@"learnrecordList"]];
            [self->coursesArray addObjectsFromArray:tempAry];
            self->currentPage = 2;
            [self updateUI];
        } fail:^(NSError *error) {
            
        }];
    } else {
        [courseViewModel afGetCourseListWithTypeID:[NSNumber numberWithInteger:currentChannel.idField] currentPage:[NSNumber numberWithInt:1] success:^(id responseObject) {
            [self->coursesArray removeAllObjects];
            self->totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
            NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Course class] json:[responseObject objectForKey:@"courseList"]];
            [self->coursesArray addObjectsFromArray:tempAry];
            self->currentPage = 2;
            [self updateUI];
            [SVProgressHUD dismiss];
        } fail:^(NSError *error) {
            
        }];
    }
}

- (void)getMoreRecommendedCourseList {
    [courseViewModel getMoreREcommendedCourseListAction:[NSNumber numberWithInt:currentPage] success:^(id responseObject) {
            NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Course class] json:[responseObject objectForKey:@"courseList"]];
            [self->coursesArray addObjectsFromArray:tempAry];
            self->totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
            if (self->currentPage == self->totalPage) {
                [self->tableView.mj_footer endRefreshingWithNoMoreData];
            } else {
                [self->tableView.mj_footer endRefreshing];
                self->currentPage ++;
            }
            [self updateUI];
    } fail:^(NSError *error) {
        
    }];
}

- (void)getRecommendedCourseList {
    [courseViewModel getFirstRecommendedCourseListAction:^(id responseObject) {
            [self->coursesArray removeAllObjects];
            NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Course class] json:[responseObject objectForKey:@"courseList"]];
            [self->coursesArray addObjectsFromArray:tempAry];
            self->currentPage = 2;
            [self updateUI];
            [SVProgressHUD dismiss];
    } fail:^(NSError *error) {
        
    }];
}

- (void)getMyChannel {
    //获取我的频道
    [channelViewModel getMyChannelWithType:[NSNumber numberWithInt:3] success:^(id responseObject) {
        if ([[responseObject objectForKey:@"state"] isEqualToString:@"1"]) {
            self->myChannel = [MyChannel yy_modelWithJSON:[responseObject objectForKey:@"myParamset"]];
            //移除之前的频道
            [self->channelsArray removeAllObjects];
            //添加从服务器获取的频道
            [self->channelsArray addObjectsFromArray:self->myChannel.params];
            for (int i = 0; i < self->channelsArray.count; i ++) {
                self->channelsArray[i] = [Channel yy_modelWithDictionary:self->channelsArray[i]];
            }
            Channel *recommendedChannel = [[Channel alloc] init];
            [recommendedChannel setName:@"推荐"];
            //在数组最前端添加“推荐”频道，作为固定的频道
            [self->channelsArray insertObject:recommendedChannel atIndex:0] ;
            //重绘
            //            [self updateUI];
            [self->channelView.collectionView reloadData];
        }
    } fail:^(NSError *error) {
        
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return channelsArray.count ;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ChannelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channelCell" forIndexPath:indexPath];
    [cell setModel:channelsArray[indexPath.row]];
    if (!tempCell) {
        [cell setIsSelected:true];
        tempCell = cell;
    }
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return coursesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:courseCellID];
    [cell setModel:coursesArray[indexPath.row] isSelected:self.isSelected];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailCourseViewController *newVC = [[DetailCourseViewController alloc] init];
    newVC.idField = ((Course *)dataArray[indexPath.row]).idField;
    [self.navigationController pushViewController:newVC animated:true];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (tempCell) {
        [SVProgressHUD show];
        ChannelCollectionViewCell *cell = (ChannelCollectionViewCell *)[channelView.collectionView cellForItemAtIndexPath:indexPath];
        [tempCell setIsSelected:false];
        [cell setIsSelected:true];
        tempCell = cell;
        currentChannel = ((Channel *)channelsArray[indexPath.row]);
        if ([currentChannel.name isEqualToString:@"推荐"]) {
            [self getRecommendedCourseList];
        } else {
            [self getCourseList];
        }
        
    }
}

- (void)didTouchBtn:(UIButton *)button {
    MoreChannelsViewController *newVC = [MoreChannelsViewController new];
    newVC.type = courseType;
    newVC.idField = myChannel.idField;
    newVC.myChannelDataArray = channelsArray;
    [self.navigationController pushViewController:newVC animated:true];
}
@end
