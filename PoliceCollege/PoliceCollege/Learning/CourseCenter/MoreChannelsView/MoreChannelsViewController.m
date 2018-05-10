//
//  MoreChannelsViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MoreChannelsViewController.h"
#import "MyChannelsCollectionViewCell.h"
#import "PCChannelViewModel.h"
@interface MoreChannelsViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation MoreChannelsViewController {
    UICollectionView *myChannelsCollectionView;
    UICollectionView *recommendedChannelsCollectionView;
    NSMutableArray *myChannelDataArray;
    NSMutableArray *recommendedChannelDataArray;
    UILabel *myChannelsLabel;
    UILabel *myChannelsSubLabel;
    UIButton *editBtn;
    UILabel *recommendedChannelsLabel;
    UILabel *recommendedChannelsSubLabel;
    PCChannelViewModel *channelViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initViews];
    [self initData];
    [self getRecommendedChannels];
}

- (void)getRecommendedChannels {
    [channelViewModel getAllChannelsWithType:[NSNumber numberWithInt:self.type] success:^(id responseObject) {
        NSArray *ary = [NSArray yy_modelArrayWithClass:[Channel class] json:[responseObject objectForKey:@"paramsetList"]];
        self->recommendedChannelDataArray = [NSMutableArray arrayWithArray:ary];
        [self updateUI];
    } fail:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)updateUI {
    [recommendedChannelsCollectionView reloadData];
    [myChannelsCollectionView reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([collectionView isEqual:myChannelsCollectionView]) {
        return myChannelDataArray.count;
    } else {
        return recommendedChannelDataArray.count;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyChannelsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if ([collectionView isEqual:myChannelsCollectionView])
        [cell setModel:myChannelDataArray[indexPath.row]];
    else
        [cell setModel:recommendedChannelDataArray[indexPath.row]];
    return cell;
}


- (void)viewWillLayoutSubviews {
//    myChannelsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//    }
}


- (void)initData {
    myChannelDataArray = [NSMutableArray new];
    recommendedChannelDataArray = [NSMutableArray new];
    channelViewModel = [PCChannelViewModel new];
}

- (void)initViews {
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    
    [self initMyChannelsCollectionView];
    [self initRecommendedChannelsCollectionView];

    myChannelsLabel = [UILabel new];
    myChannelsSubLabel = [UILabel new];
    editBtn = [UIButton new];
    recommendedChannelsLabel = [UILabel new];
    recommendedChannelsSubLabel = [UILabel new];
    
    [self.view addSubview:myChannelsLabel];
    [self.view addSubview:myChannelsSubLabel];
    [self.view addSubview:editBtn];
    [self.view addSubview:recommendedChannelsSubLabel];
    [self.view addSubview:recommendedChannelsLabel];
    
    [myChannelsLabel setText:@"我的频道"];
    [myChannelsSubLabel setText:@"点击进入频道"];

    myChannelsSubLabel.font = [UIFont fontWithName:@"PingFangSC-Thin" size:13];
    [recommendedChannelsLabel setText:@"频道推荐"];
    [recommendedChannelsSubLabel setText:@"点击添加频道"];
    recommendedChannelsSubLabel.font = [UIFont fontWithName:@"PingFangSC-Thin" size:13];
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [editBtn setTitleColor:rgb(234, 74, 77) forState:UIControlStateNormal];
    [editBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    editBtn.layer.cornerRadius = 12.5;
    editBtn.layer.masksToBounds = true;
    editBtn.layer.borderWidth = 1;
    editBtn.layer.borderColor = rgb(234, 74, 77).CGColor;
    
    [myChannelsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(20);
        make.width.mas_equalTo(80);
    }];
    
    [myChannelsSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->myChannelsLabel.mas_right).offset(10);
        make.bottom.equalTo(self->myChannelsLabel);
        make.right.equalTo(self.view);
    }];
    
    [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);

        make.bottom.equalTo(self->myChannelsLabel);
        make.size.mas_equalTo(CGSizeMake(40, 25));
    }];
    
    [myChannelsCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->myChannelsLabel.mas_bottom);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(200);
    }];
    
    [recommendedChannelsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self->myChannelsCollectionView.mas_bottom).offset(20);
        make.width.mas_equalTo(80);
    }];
    
    [recommendedChannelsSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->recommendedChannelsLabel.mas_right).offset(10);
        make.bottom.equalTo(self->recommendedChannelsLabel);
        make.right.equalTo(self.view);
    }];
    
    [recommendedChannelsCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self->recommendedChannelsLabel.mas_bottom);
        make.bottom.equalTo(self.view);
    }];
}

- (void)initMyChannelsCollectionView {
    // 流水布局
    UICollectionViewFlowLayout *myChannelsLayout = [[UICollectionViewFlowLayout alloc] init];
    myChannelsLayout.itemSize = CGSizeMake(90, 40);
    myChannelsLayout.minimumLineSpacing = 10;
    myChannelsLayout.minimumInteritemSpacing = 10;
    myChannelsLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);

    myChannelsCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:myChannelsLayout];
    [myChannelsCollectionView setBackgroundColor:MyWhiteBackgroundColor];
    myChannelsCollectionView.delegate = self;
    myChannelsCollectionView.dataSource = self;
    [self.view addSubview:myChannelsCollectionView];
    [myChannelsCollectionView registerClass:[MyChannelsCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (void)initRecommendedChannelsCollectionView {
    UICollectionViewFlowLayout *recomendedChannelLayout = [[UICollectionViewFlowLayout alloc] init];
    recomendedChannelLayout.itemSize = CGSizeMake(90, 40);
    recomendedChannelLayout.minimumLineSpacing = 10;
    recomendedChannelLayout.minimumInteritemSpacing = 10;
    recomendedChannelLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
    
    recommendedChannelsCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:recomendedChannelLayout];
    [recommendedChannelsCollectionView setBackgroundColor:MyWhiteBackgroundColor];
    recommendedChannelsCollectionView.delegate = self;
    recommendedChannelsCollectionView.dataSource = self;
    [self.view addSubview:recommendedChannelsCollectionView];
    [recommendedChannelsCollectionView registerClass:[MyChannelsCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}


































@end
