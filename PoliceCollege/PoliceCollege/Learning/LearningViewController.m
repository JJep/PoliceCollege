//
//  LearningViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "LearningViewController.h"
#import "LearningTableViewCell.h"
@interface LearningViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation LearningViewController {
    UICollectionView *collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置CollectionView的属性
    collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];

    
    CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    //设置间距
    NSInteger margin = 10;
    flowLayout.minimumInteritemSpacing = margin;
    flowLayout.minimumInteritemSpacing = margin;
    
    //设置item尺寸
    CGFloat itemW = 74;
    CGFloat itemH = 74;
    flowLayout.itemSize = CGSizeMake(itemW, itemH);
    
    flowLayout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);

    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.scrollEnabled = YES;
    [self.view addSubview:collectionView];
    //注册Cell
    [collectionView registerClass:[LearningTableViewCell class] forCellWithReuseIdentifier:@"cell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LearningTableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell = [[LearningTableViewCell alloc] init];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
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
