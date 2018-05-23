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
#import "MyChannel.h"
#import <MJRefresh.h>
@interface BookCenterViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@end

static const int bookType = 4;
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
    bookViewModel = [PCBookViewModel new];
    channelViewModel = [PCChannelViewModel new];
    booksArray = [NSMutableArray new];
    channelsArray = [NSMutableArray new];
    Channel *recommendChannel = [Channel new];
    [recommendChannel setName:@"推荐"];
    [channelsArray addObject:recommendChannel];
    currentPage = 1;
}

- (void)createUI {
    
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    self.title = @"图书中心";
    
    backView = [[BackView alloc] init];
    [backView setName:@"暂无图书"];
    [backView setImage:[UIImage imageNamed:@"bookBackIcon"]];
    [self.view addSubview:backView];
    
    tableView = [[UITableView alloc] init];
    [backView addSubview:tableView];
    tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        if ([self->currentChannel.name isEqualToString:@"推荐"]) {
            [self getMoreRecommendedBookList];
        } else {
            [self getMoreBooklist];
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
    [tableView registerClass:[BookCenterTableViewCell class] forCellReuseIdentifier:bookCellID];
    
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
    if (booksArray.count == 0) {
        [tableView setHidden:true];
    } else {
        [tableView setHidden:false];
    }
//    [channelView.collectionView reloadData];
    [tableView reloadData];
}

- (void)getData {
    if (self.isSelected) {
        [self getBookList];
    } else {
        [self getMyChannel];
        if (channelsArray.count == 1) {
            [self getRecommendedBookList];
        } else {
            [self getBookList];
        }
    }
}

- (void)getMoreBooklist {
    [bookViewModel getBookListActionWithTypeID:[NSNumber numberWithInteger:currentChannel.idField] currentPage:[NSNumber numberWithInt:currentPage] success:^(id responseObject) {
        NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Book class] json:[responseObject objectForKey:@"bookList"]];
        [self->booksArray addObjectsFromArray:tempAry];
        //
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

- (void)getBookList {
    if (self.isSelected) {
        [bookViewModel downloadSelectedBookListWithCurrentPage:[NSNumber numberWithInt:1] success:^(id responseObject) {
            [self->booksArray removeAllObjects];
            NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Book class] json:[responseObject objectForKey:@"learnrecordList"]];
            [self->booksArray addObjectsFromArray:tempAry];
            self->currentPage = 2;
            [self updateUI];
        } fail:^(NSError *error) {
            
        }];
    } else {
        [bookViewModel getBookListActionWithTypeID:[NSNumber numberWithInteger:currentChannel.idField] currentPage:[NSNumber numberWithInt:1] success:^(id responseObject) {
            [self->booksArray removeAllObjects];
            self->totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
            NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Book class] json:[responseObject objectForKey:@"bookList"]];
            [self->booksArray addObjectsFromArray:tempAry];
            self->currentPage = 2;
            [self updateUI];
            [SVProgressHUD dismiss];
        } fail:^(NSError *error) {
            [SVProgressHUD dismiss];
        }];
    }
}

- (void)getMoreRecommendedBookList {
    [bookViewModel getRecommendBookListAction:[NSNumber numberWithInt:currentPage] success:^(id responseObject) {
        NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Book class] json:[responseObject objectForKey:@"bookList"]];
        [self->booksArray addObjectsFromArray:tempAry];
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

- (void)getRecommendedBookList {
    [bookViewModel getRecommendBookListAction:[NSNumber numberWithInt:1] success:^(id responseObject) {
        [self->booksArray removeAllObjects];
        NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Book class] json:[responseObject objectForKey:@"bookList"]];
        [self->booksArray addObjectsFromArray:tempAry];
        self->currentPage = 2;
        [self updateUI];
        [SVProgressHUD dismiss];
    } fail:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
}

- (void)getMyChannel {
    //获取我的频道
    [channelViewModel getMyChannelWithType:[NSNumber numberWithInt:bookType] success:^(id responseObject) {
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
    return booksArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:bookCellID];
    [cell setModel:booksArray[indexPath.row] isSelected:self.isSelected];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BookDetailViewController *newVC = [BookDetailViewController new];
    newVC.model = booksArray[indexPath.row];
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
            [self getRecommendedBookList];
        } else {
            [self getBookList];
        }

    }
}

- (void)didTouchBtn:(UIButton *)button {
    MoreChannelsViewController *newVC = [MoreChannelsViewController new];
    newVC.type = bookType;
    newVC.idField = myChannel.idField;
    newVC.myChannelDataArray = channelsArray;
    [self.navigationController pushViewController:newVC animated:true];
}
@end






















