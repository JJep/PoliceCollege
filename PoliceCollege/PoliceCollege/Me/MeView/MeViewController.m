//
//  MeViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MeViewController.h"
#import "MeTableViewModel.h"
#import "MeTableViewCell.h"
#import "PersonalInformationViewController.h"
#import "ChangePasswordViewController.h"
#import "PushSettingViewController.h"
#import "JMUserLocalData.h"
@interface MeViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,retain)NSArray *dataArray;
@property (nonatomic,retain)NSMutableArray *modelArray;
@property (nonatomic,retain)NSURL *imageURL;
@property (nonatomic,copy)NSString *userName;
@property (nonatomic)int totalTime;
@property (nonatomic)int todayTime;
@property (nonatomic,copy)NSString *cacheCapacity;
@property (nonatomic,copy)NSString *maturityTime;
@end

@implementation MeViewController {
//    MeTableView *meView;
    UITableView *tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _imageURL = [NSURL URLWithString:@""];
    _userName = [NSString new];
    _cacheCapacity = [NSString new];
    _maturityTime = [NSString new];
    
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.y, self.view.bounds.origin.y - 20, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] init];
    _modelArray = [[NSMutableArray alloc] init];
    tableView.contentInsetAdjustmentBehavior = NO;
    tableView.tableFooterView = [[UIView alloc] init];
    [self initDataArray];
    
}

- (void)initDataArray {
    self.dataArray = @[
                       @{
                           @"tag":@"portrait",
                           @"userName":self.userName,
                           @"totalTime":[NSNumber numberWithInt:self.totalTime],
                           @"todayTime":[NSNumber numberWithInt:self.todayTime],
                           @"portraitURL":self.imageURL
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"changePasswordIcon"],
                           @"title":@"修改密码",
                           @"content":@""
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"notificationSettingIcon"],
                           @"title":@"推送设置",
                           @"content":@""
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"clearCacheIcon"],
                           @"title":@"清理缓存",
                           @"content":self.cacheCapacity
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"expiredTimeIcon"],
                           @"title":@"服务到期时间",
                           @"content":self.maturityTime
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"aboutIcon"],
                           @"title":@"关于",
                           @"content":@""
                           }
                       ];
    for (NSDictionary *dic in _dataArray) {
        
        MeTableViewModel *model = [MeTableViewModel initWithDictionary:dic];
        //将不同的子类创建的model对象添加到数组中
        [self.modelArray addObject:model];
        
    }
}

- (void)updateData {
    self.dataArray = @[
                       @{
                           @"tag":@"portrait",
                           @"userName":self.userName,
                           @"totalTime":[NSNumber numberWithInt:self.totalTime],
                           @"todayTime":[NSNumber numberWithInt:self.todayTime],
                           @"portraitURL":self.imageURL
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"changePasswordIcon"],
                           @"title":@"修改密码",
                           @"content":@""
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"notificationSettingIcon"],
                           @"title":@"推送设置",
                           @"content":@""
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"clearCacheIcon"],
                           @"title":@"清理缓存",
                           @"content":self.cacheCapacity
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"expiredTimeIcon"],
                           @"title":@"服务到期时间",
                           @"content":self.maturityTime
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"aboutIcon"],
                           @"title":@"关于",
                           @"content":@""
                           }
                       ];
    [self.modelArray removeAllObjects];

    for (NSDictionary *dic in _dataArray) {
        
        MeTableViewModel *model = [MeTableViewModel initWithDictionary:dic];
        //将不同的子类创建的model对象添加到数组中
        [self.modelArray addObject:model];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true animated:animated];
    if ([JMUserLocalData sharedManager].user) {
        _imageURL = [NSURL URLWithString:[JMUserLocalData sharedManager].user.headimg];
        _userName = [JMUserLocalData sharedManager].user.nickname;
        NSLog(@"%@",[JMUserLocalData sharedManager].user);
        [self updateData];
        [tableView reloadData];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //根据indexPath.row获取对应的model
    MeTableViewModel *model = [self.modelArray objectAtIndex:indexPath.row];
    
    //根据取出的modle获取对应的类名
    NSString *modelName = [NSString stringWithUTF8String:object_getClassName(model)];
    
    //根据不同的唯一标识重用不同的cell
    MeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:modelName];
    
    if (cell == nil) {
        //根据我们每行提供的model创建出对应的cell（根据不同的需求生产不同的产品）
        cell = [MeTableViewCell initWithModel:model];
    }
    
    //赋值
    [cell setModel:model];
    
    return cell;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 201;
    } else {
        return 60;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO];
    if (indexPath.row == 0) {
        [self pushToViewController:[PersonalInformationViewController new]];
        
    } else if (indexPath.row == 1 ) {
        [self pushToViewController:[ChangePasswordViewController new]];
    } else if (indexPath.row == 2) {
        [self pushToViewController:[PushSettingViewController new]];
    } else if (indexPath.row == 3) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否删除缓存" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            [self cacheClear];
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }];
        [alert addAction:cancel];
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }

}

- (void)cacheClear {
    // 获取Library文件夹路径
    NSString *libPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    // 获取Library下Caches文件夹路径
    NSString *cachePath = [libPath stringByAppendingPathComponent:@"Caches"];
    // 实例化NSFileManager
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 获取Caches文件夹下的所有文件及文件夹
    NSArray *array = [fileManager contentsOfDirectoryAtPath:cachePath error:nil];
    // 循环删除Caches下的所有文件及文件夹
    for (NSString *fileName in array) {
        [fileManager removeItemAtPath:[cachePath stringByAppendingPathComponent:fileName] error:nil];
    }
}

- (void)pushToViewController:(UIViewController *)viewController {
    viewController.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:viewController animated:true];
}

@end
