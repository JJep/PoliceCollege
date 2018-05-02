//
//  PCAnouncementTableViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCAnouncementTableViewController.h"
#import "AnouncementTableViewCell.h"
#import "PCPromotionDetailViewController.h"
@interface PCAnouncementTableViewController ()

@end

@implementation PCAnouncementTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通知公告";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cell";
    AnouncementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[AnouncementTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PCPromotionDetailViewController *VC = [PCPromotionDetailViewController new];
//    [VC.navigationController setNavigationBarHidden:true];
    [self.navigationController pushViewController:VC animated:true];
}

-(void)viewWillAppear:(BOOL)animated
{
//    self.tabBarController.hidesBottomBarWhenPushed = YES;
//    [self.navigationController setNavigationBarHidden:false];
    [self.navigationController setNavigationBarHidden:false animated:animated];
}


@end
