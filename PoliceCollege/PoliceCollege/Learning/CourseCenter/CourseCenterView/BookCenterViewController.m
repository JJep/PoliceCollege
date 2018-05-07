//
//  BookCenterViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "BookCenterViewController.h"
#import "ChannelCollectionViewCell.h"
#import "BookCenterTableViewCell.h"
#import "ChannelView.h"
#import "BookDetailViewController.h"
#import "MoreChannelsViewController.h"
#import "BackView.h"
#import "Channel.h"
#import "PCBookViewModel.h"
#import "PCChannelViewModel.h"
#import "Book.h"
@interface BookCenterViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@end

static const int courseType = 3;
static const int bookType = 4;
static const int videoType = 5;
static const int noType = -1;
static NSString *bookCellID = @"BookCenterTableViewCell";
@implementation BookCenterViewController {
    UITableView *tableView;
    ChannelView *channelView;
    ChannelCollectionViewCell *tempCell;
    BackView *backView;
    NSMutableArray *dataArray;
    PCBookViewModel *bookViewModel;
    PCChannelViewModel *channelViewModel;
    NSMutableArray *channelsArray;
    NSMutableArray *booksArray;
    int currentType ;
    int currentPage ;
}
- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initData];
    [self createUI];
    [self getData];
}

- (void)initData {
    bookViewModel = [PCBookViewModel new];
    channelViewModel = [PCChannelViewModel new];
    booksArray = [NSMutableArray new];
    channelsArray = [NSMutableArray new];
    currentType = noType;
    currentPage = 1;
    Channel *channel = [[Channel alloc] init];
    channel.name = @"推荐";
    [booksArray addObject:channel];
}

- (void)createUI {
    
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    self.title = @"图书中心";
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds ];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    channelView = [[ChannelView alloc] init];
    [self.view addSubview:channelView];
    channelView.collectionView.delegate = self;
    channelView.collectionView.dataSource = self;
    [channelView.addButton addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //注册Cell
    [channelView.collectionView registerClass:[ChannelCollectionViewCell class] forCellWithReuseIdentifier:@"channelCell"];
    [tableView registerClass:[BookCenterTableViewCell class] forCellReuseIdentifier:bookCellID];
    
    [channelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(45);
    }];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self->channelView.mas_bottom).offset(5);
    }];

}

- (void)getData {
    [self getMyChannel];
    if (currentType == noType) {
        [self getRecommendedBookList];
    }
}

- (void)getRecommendedBookList {
    [bookViewModel getRecommendBookListAction:[NSNumber numberWithInt:currentPage] success:^(id responseObject) {
        if ([[responseObject objectForKey:@"state"] isEqualToString:@"1"]) {
            NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Book class] json:[responseObject objectForKey:@"bookList"]];
            [self->booksArray addObjectsFromArray:tempAry];
            self->currentPage++;
            [self->tableView reloadData];
        }
    } fail:^(NSError *error) {
        
    }];
}

- (void)getMyChannel {
    //获取我的频道
    [channelViewModel getMyChannelWithType:[NSNumber numberWithInt:bookType] success:^(id responseObject) {
        if ([[responseObject objectForKey:@"state"] isEqualToString:@"1"]) {
            self->channelsArray = [[NSMutableArray alloc] initWithArray:[NSArray yy_modelArrayWithClass:[Channel class] json:[responseObject objectForKey:@"params"]]];
            [self->channelView.collectionView reloadData];
        }
    } fail:^(NSError *error) {
        
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //还有一个推荐频道，属于自带的频道
    return channelsArray.count + 1;
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
    return booksArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:bookCellID];
    [cell setModel:booksArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BookDetailViewController *newVC = [BookDetailViewController new];
    newVC.model = booksArray[indexPath.row];
    [self.navigationController pushViewController:newVC animated:true];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (tempCell) {
        ChannelCollectionViewCell *cell = (ChannelCollectionViewCell *)[channelView.collectionView cellForItemAtIndexPath:indexPath];
        [tempCell setIsSelected:false];
        [cell setIsSelected:true];
        tempCell = cell;
    }
    
}

- (void)didTouchBtn:(UIButton *)button {
    MoreChannelsViewController *newVC = [MoreChannelsViewController new];
    [self.navigationController pushViewController:newVC animated:true];
}
@end






















