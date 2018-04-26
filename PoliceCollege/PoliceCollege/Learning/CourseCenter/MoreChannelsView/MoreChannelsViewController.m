//
//  MoreChannelsViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MoreChannelsViewController.h"
#import "MyChannelsCollectionViewCell.h"
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
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initMyChannelsCollectionView];
    [self initRecommendedChannelsCollectionView];
    [self initSubViews];
    [self initData];
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
        [cell setChannelModel:myChannelDataArray[indexPath.row]];
    else
        [cell setChannelModel:recommendedChannelDataArray[indexPath.row]];
    return cell;
}


- (void)viewWillLayoutSubviews {
//    myChannelsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//    }
}


- (void)initData {
    
}

- (void)initSubViews {
    
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
    [recommendedChannelsLabel setText:@"频道推荐"];
    [recommendedChannelsSubLabel setText:@"点击添加频道"];
    [editBtn setImage:[UIImage imageNamed:@"edit"] forState:UIControlStateNormal];
    [editBtn setTitleColor:rgb(234, 74, 77) forState:UIControlStateNormal];
    editBtn.layer.borderWidth = 1;
    editBtn.layer.borderColor = rgb(234, 74, 77).CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initMyChannelsCollectionView {
    // 流水布局
    UICollectionViewFlowLayout *myChannelsLayout = [[UICollectionViewFlowLayout alloc] init];
    myChannelsLayout.itemSize = CGSizeMake(80, 50);
    myChannelsLayout.minimumLineSpacing = 10;
    myChannelsLayout.minimumInteritemSpacing = 10;
    myChannelsLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);

    myChannelsCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:myChannelsLayout];
    [myChannelsCollectionView setBackgroundColor:MyWhiteBackgroundColor];
    myChannelsCollectionView.delegate = self;
    myChannelsCollectionView.dataSource = self;
    [self.view addSubview:myChannelsCollectionView];
    [myChannelsCollectionView registerClass:[MyChannelsCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (void)initRecommendedChannelsCollectionView {
    UICollectionViewFlowLayout *recomendedChannelLayout = [[UICollectionViewFlowLayout alloc] init];
    recomendedChannelLayout.itemSize = CGSizeMake(80, 50);
    recomendedChannelLayout.minimumLineSpacing = 10;
    recomendedChannelLayout.minimumInteritemSpacing = 10;
    recomendedChannelLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    recommendedChannelsCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:recomendedChannelLayout];
    [recommendedChannelsCollectionView setBackgroundColor:MyWhiteBackgroundColor];
    recommendedChannelsCollectionView.delegate = self;
    recommendedChannelsCollectionView.dataSource = self;
    [self.view addSubview:recommendedChannelsCollectionView];
    [recommendedChannelsCollectionView registerClass:[MyChannelsCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}


































@end
