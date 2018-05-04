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
#import "PCRecommendBookViewModel.h"
@interface BookCenterViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation BookCenterViewController {
    UITableView *tableView;
    ChannelView *channelView;
    ChannelCollectionViewCell *tempCell;
    BackView *backView;
    PCRecommendBookViewModel *viewModel;
    NSMutableArray *dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    viewModel = [PCRecommendBookViewModel new];
    [self createUI];
    [self getData];
}

- (void)createUI {
    
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    self.title = @"课程中心";
    
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
    [viewModel getRecommendBooksAction:10 success:^(id responseObject) {
        
    } fail:^(NSError *error) {
        NSLog(@"fail");
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ChannelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channelCell" forIndexPath:indexPath];
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
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"BookCenterTableViewCell";
    BookCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell = [[BookCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BookDetailViewController *newVC = [BookDetailViewController new];
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






















