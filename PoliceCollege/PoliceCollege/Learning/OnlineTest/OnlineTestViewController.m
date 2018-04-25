//
//  OnlineTestViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "OnlineTestViewController.h"
#import "OnlineTestCollectionViewCell.h"
@interface OnlineTestViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation OnlineTestViewController {
    UICollectionView *collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    self.title = @"党员学习";
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置cell的尺寸
    layout.itemSize = CGSizeMake(120, 75);
    
    // 设置每一行的间距
    layout.minimumLineSpacing = 20;
    
    // 设置每个cell的间距
    layout.minimumInteritemSpacing = 25;
    
    // 设置每组的内边距
    layout.sectionInset = UIEdgeInsetsMake(22, 30, 22, 30);
    
    
    //设置CollectionView的属性
    collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [collectionView setBackgroundColor:[UIColor whiteColor]];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.scrollEnabled = YES;
    [self.view addSubview:collectionView];
    //注册Cell
    [collectionView registerClass:[OnlineTestCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OnlineTestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
