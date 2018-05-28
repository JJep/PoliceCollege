//
//  CourseCenterViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//
#import "VideoCenterViewController.h"
#import "BookCenterViewController.h"
#import "ChannelCollectionViewCell.h"
#import "ChannelView.h"
#import "VideoTableViewCell.h"
#import "BackView.h"
#import "VideoViewModel.h"
#import "Video.h"
#import "Channel.h"
#import "PCChannelViewModel.h"
#import "MyChannel.h"
#import "DetailVideoViewController.h"
#import "SearchViewController.h"
#import <MJRefresh.h>
@interface  VideoCenterViewController() <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@end
//static const int videoType = 5;
static const int searchButtonTag = 5;

@implementation VideoCenterViewController {
    UITableView *tableView;
    ChannelView *channelView;
    ChannelCollectionViewCell *tempCell;
    BackView *backView;
    NSMutableArray *videoArray;
    NSUInteger currentPage;
    NSUInteger totalPage;
    VideoViewModel *videoViewModel;
    PCChannelViewModel *channelViewModel;
    MyChannel *myChannel;
    Channel *currentChannel;
    NSMutableArray *channelsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViews];
    [self initData];
    [self downloadRecommendedVideo];
    
}

- (void)updateUI  {
    if (videoArray.count == 0) {
        [tableView setHidden:true];
    } else {
        [tableView setHidden:false];
    }
//    [channelView.collectionView reloadData];
    [tableView reloadData];
}


- (void)initNavigationBar {
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [searchButton setImage:[UIImage imageNamed:@"searchIcon"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [searchButton setTag:searchButtonTag];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    self.navigationItem.rightBarButtonItem = rightButton;
    [self.view setBackgroundColor:rgb(244, 244, 249)];
}

- (void)initViews {
    
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    self.title = @"视频中心";
    
    [self initNavigationBar];
    
    backView = [[BackView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:backView];
    
    [backView setImage:[UIImage imageNamed:@"video"]];
    [backView setName:@"暂无公开视频"];
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds ];
    [backView addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setHidden:true];
    [tableView registerClass:[VideoTableViewCell class] forCellReuseIdentifier:@"videoCell"];
    tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        if ([self->currentChannel.name isEqualToString:@"推荐"]) {
            [self downloadRecommendedVideo];
        } else {
            [self afGetVideoList];
        }
    }];
    
    channelView = [[ChannelView alloc] init];
    [self.view addSubview:channelView];
    channelView.collectionView.delegate = self;
    channelView.collectionView.dataSource = self;
    
    //注册Cell
    [channelView.collectionView registerClass:[ChannelCollectionViewCell class] forCellWithReuseIdentifier:@"channelCell"];
    
    [channelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(45);
    }];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self->channelView.mas_bottom).offset(5);
    }];
}

- (void)initData {
    videoArray = [NSMutableArray new];
    channelsArray = [NSMutableArray new];
    currentPage = 1;
    totalPage = 1;
    videoViewModel = [VideoViewModel new];
    channelViewModel = [PCChannelViewModel new];
    [self downloadRecommendedVideo];
    [self getMyChannel];
}

- (void)downloadRecommendedVideo {
    [videoViewModel getRecommendedVideoListActionWithCurrentPage:[NSNumber numberWithUnsignedInteger:currentPage] success:^(id responseObject) {
        self->totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
        if (self->currentPage == 1) {
            [self->videoArray removeAllObjects];
        }
        NSArray *ary = [NSArray yy_modelArrayWithClass:[Video class] json:[responseObject objectForKey:@"videoList"]];
        [self->videoArray addObjectsFromArray:ary];
        if (self->currentPage == self->totalPage) {
            [self->tableView.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self->tableView.mj_footer endRefreshing];
            self->currentPage ++;
        }
        [SVProgressHUD dismiss];
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
}

- (void)afGetVideoList {
    [videoViewModel getVideoListActionWithType:[NSNumber numberWithInteger:currentChannel.idField] currentPage:[NSNumber numberWithInteger:currentPage] success:^(id responseObject) {
        if (self->currentPage == 1) {
            [self->videoArray removeAllObjects];
        }
        NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Video class] json:[responseObject objectForKey:@"videoList"]];
        [self->videoArray addObjectsFromArray:tempAry];
        if (self->currentPage == self->totalPage) {
            [self->tableView.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self->tableView.mj_footer endRefreshing];
            self->currentPage++;
        }
        [self updateUI];
        [SVProgressHUD dismiss];
    } fail:^(NSError *error) {
        
    }];
}

- (void)getMyChannel {
    //获取我的频道
    [channelViewModel getMyChannelWithType:[NSNumber numberWithInt:learningVideoType] success:^(id responseObject) {
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
            [SVProgressHUD dismiss];
        }
    } fail:^(NSError *error) {
        
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return channelsArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ChannelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channelCell" forIndexPath:indexPath];
    if (!tempCell) {
        [cell setIsSelected:true];
        tempCell = cell;
    }
    [cell setModel:channelsArray[indexPath.row]];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return videoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"videoCell";
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    cell = [[VideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    [cell setModel:videoArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO];
    DetailVideoViewController *detailVideoViewController = [DetailVideoViewController new];
    detailVideoViewController.idField = ((Video *)videoArray[indexPath.row]).idField;
    [self.navigationController pushViewController:detailVideoViewController animated:true];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (tempCell) {
        [SVProgressHUD show];
        ChannelCollectionViewCell *cell = (ChannelCollectionViewCell *)[channelView.collectionView cellForItemAtIndexPath:indexPath];
        [tempCell setIsSelected:false];
        [cell setIsSelected:true];
        tempCell = cell;
        currentChannel = ((Channel *)channelsArray[indexPath.row]);
        currentPage = 1;
        if ([currentChannel.name isEqualToString:@"推荐"]) {
            [self downloadRecommendedVideo];
        } else {
            [self afGetVideoList];
        }
    }
    
}

- (void)didTouchBtn:(UIButton *)button {
    SearchViewController *searchViewController = [[SearchViewController alloc] initWithType:[NSNumber numberWithInt:learningVideoType]];
    [self.navigationController pushViewController:searchViewController animated:true];
}

@end






















