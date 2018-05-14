//
//  PersonalInformationViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PersonalInformationViewController.h"
#import "PersonalInfoTableViewCell.h"
#import "UserInfo.h"
#import "UserViewModel.h"
#import "ChangeTextViewController.h"
@interface PersonalInformationViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PersonalInformationViewController {
    UITableView *tableView;
    NSMutableArray *dataArray;
    UserInfo *userInfo;
    UserViewModel *userViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    [self initDataArray];
    [self getData];
}

- (void)getData {
    [userViewModel getUserInfoAction:^(id responseObject) {
        self->userInfo = [UserInfo yy_modelWithJSON:[responseObject objectForKey:@"userInfo"]];
        [self->tableView reloadData];
    } fail:^(NSError *error) {
        
    }];
}

- (void)initViews {
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    dataArray = [NSMutableArray new];
    self.title = @"个人资料";
    
    [tableView registerClass:[PersonalInfoTableViewCell class] forCellReuseIdentifier:@"portraitCell"];
    [tableView registerClass:[PersonalInfoTableViewCell class] forCellReuseIdentifier:@"itemCell"];
    
}

- (void)initDataArray {
    userViewModel = [UserViewModel new];
    dataArray = [[NSMutableArray alloc]
                 initWithArray:@[
  @{@"头像":@"headimg"},
  @{@"账号":@"phone"},
  @{@"昵称":@"nickname"},
  @{@"性别":@"sex"},
  @{@"出生日期":@"birthday"},
  @{@"家乡":@"hometown"},
  @{@"现居地":@"livingplace"},
  @{@"职业":@"pos"},
  @{@"兴趣":@"hobby"},
  @{@"一句家乡话":@"nativeDialect"}
  ]];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalInfoTableViewCell *cell ;
    if (indexPath.row == 0) {
        NSString *cellID = @"portraitCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        NSString *valueString = [((NSDictionary *)dataArray[indexPath.row]) allValues][0] ;
        NSString *keyString =[((NSDictionary *)dataArray[indexPath.row]) allKeys][0];
        [cell setTitle:keyString];
        [cell setImageURL:[userInfo valueForKey:valueString]];
    } else {
        NSString *cellID = @"itemCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        NSString *valueString = [((NSDictionary *)dataArray[indexPath.row]) allValues][0] ;
        NSString *keyString =[((NSDictionary *)dataArray[indexPath.row]) allKeys][0];
        [cell setTitle:keyString];
        [cell setContent:[userInfo valueForKey:valueString]];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 106;
    } else {
        return 50;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChangeTextViewController *changeTextVC = [[ChangeTextViewController alloc] init];
    NSString *keyString =[((NSDictionary *)dataArray[indexPath.row]) allKeys][0];
    changeTextVC.name = keyString;
    [self.navigationController pushViewController:changeTextVC animated:true];
    PersonalInfoTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:false];
}


@end
