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
    
    _imageURL = [[NSURL alloc] initWithString:@"www.baidu.com"];
    _userName = [NSString new];
    _cacheCapacity = [NSString new];
    _maturityTime = [NSString new];
    
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.y, self.view.bounds.origin.y - 20, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    _modelArray = [[NSMutableArray alloc] init];
    tableView.contentInsetAdjustmentBehavior = NO;
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
                           @"image":[UIImage imageNamed:@"banner"],
                           @"title":@"修改密码",
                           @"content":@""
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"banner"],
                           @"title":@"推送设置",
                           @"content":@""
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"banner"],
                           @"title":@"清理缓存",
                           @"content":self.cacheCapacity
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"banner"],
                           @"title":@"缓存到期时间",
                           @"content":self.maturityTime
                           },
                       @{
                           @"tag":@"item",
                           @"image":[UIImage imageNamed:@"banner"],
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:true animated:animated];
    
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
    if (indexPath.row == 0) {
        [self pushToViewController:[PersonalInformationViewController new]];
        
    } else if (indexPath.row == 1 ) {
        [self pushToViewController:[ChangePasswordViewController new]];
    } else if (indexPath.row == 2) {
        [self pushToViewController:[PushSettingViewController new]];
    }
}

- (void)pushToViewController:(UIViewController *)viewController {
    viewController.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:viewController animated:true];
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
