//
//  LearningViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "LearningViewController.h"
#import "LearningTableViewCell.h"
#import "OnlineTestViewController.h"
@interface LearningViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation LearningViewController {
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
    layout.itemSize = CGSizeMake(50, 75);
    
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
    [collectionView registerClass:[LearningTableViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(212);
    }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LearningTableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    cell = [[LearningTableViewCell alloc] init];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        OnlineTestViewController *newVC = [[OnlineTestViewController alloc] init];
        newVC.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:newVC animated:true];
    }
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
