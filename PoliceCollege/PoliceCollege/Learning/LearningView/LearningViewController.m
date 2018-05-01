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
#import "CourseCenterViewController.h"
#import "VideoCenterViewController.h"
#import "PCTopView.h"
#import "LearningMainCollectionView.h"
#import "TestViewController.h"
@interface LearningViewController () <UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation LearningViewController {
    LearningMainCollectionView *collectionView;
    NSArray *dataArray;
    PCTopView *topView;
    UITableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    self.title = @"党员学习";
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.tableHeaderView = [self headView];
    //防止添加headview后tableview无法滑动到底部
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 160, 0);

    //利用systemLayoutSizeFittingSize:计算出真实高度
    CGFloat height = [tableView.tableHeaderView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect headerFrame = tableView.tableHeaderView.frame;
    headerFrame.size.height = height;
    //修改tableHeaderView的frame
    tableView.tableHeaderView.frame = headerFrame;
    
    [self.view addSubview:tableView];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@", tableView.description);
}

- (UIView *)headView {
    UIView *view = [UIView new];
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 242)];
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
    LearningMainCollectionView *collectionView = [[LearningMainCollectionView alloc] initWithFrame:view.bounds collectionViewLayout:layout];
    collectionView.delegate = self;
    PCTopView *topView = [PCTopView new];
    [view addSubview:topView];
    [view addSubview:collectionView];
    
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(view);
        make.height.mas_equalTo(212);
    }];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view);
        make.top.equalTo(collectionView.mas_bottom);
        make.height.mas_equalTo(30);
        make.bottom.equalTo(view);
    }];
    [topView.title setText:@"党员测试"];
    
    return view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"testCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"HTML在线测试";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TestViewController *testViewController = [TestViewController new];
    testViewController.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:testViewController animated:true];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        OnlineTestViewController *newVC = [[OnlineTestViewController alloc] init];
        newVC.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:newVC animated:true];
    } else if (indexPath.row == 1) {
        CourseCenterViewController *newVC = [CourseCenterViewController new];
        newVC.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:newVC animated:true];
    } else if (indexPath.row == 2) {
        CourseCenterViewController *newVC = [CourseCenterViewController new];
        newVC.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:newVC animated:true];
    } else if (indexPath.row == 3) {
        VideoCenterViewController *newVC = [VideoCenterViewController new];
        newVC.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:newVC animated:true];
    }
}

@end
