//
//  PCAnouncementTableViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCAnouncementTableViewController.h"
#import "AnouncementTableViewCell.h"
#import "PCAnnouncementDetailViewController.h"
#import "PCAnnouncementModel.h"
#import "PCAnouncementListViewModel.h"
#import "BackView.h"
@interface PCAnouncementTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end
int currentPage = 0;
int totalPage = 0;
@implementation PCAnouncementTableViewController {
    UITableView *tableView;
    PCAnouncementListViewModel *viewModel;
    NSMutableArray *promotionArray;
    BackView *backView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initViews];
    
    viewModel = [PCAnouncementListViewModel new];
    promotionArray = [NSMutableArray new];
    [self downloadData];
    
}

- (void)initViews {
    self.title = @"通知公告";
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    
    backView = [[BackView alloc] initWithFrame:self.view.bounds];
    [backView setImage:[UIImage imageNamed:@"announcementBackIcon"]];
    [backView setName:@"暂无通知公告"];
    [self.view addSubview:backView];
    
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [backView addSubview:tableView];
    //没有数据的时候显示背景图
    [tableView setHidden:true];

}

- (void)updateUI {
    if (promotionArray.count == 0) {
        [tableView setHidden:true];
    } else {
        [tableView setHidden:false];
    }
    [tableView reloadData];
}


- (void)downloadData {
    [viewModel getPromotionListActionWithCurrentPage:[NSNumber numberWithInt:currentPage] success:^(id responseObject) {
        totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
        
        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[PCAnnouncementModel class] json:[responseObject objectForKey:@"newList"]];
        
        [self->promotionArray addObjectsFromArray:modelArray];
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
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
    [cell setModel:promotionArray[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (promotionArray.count == 0) {
        return 0;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return promotionArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PCAnnouncementDetailViewController *VC = [PCAnnouncementDetailViewController new];
    [self.navigationController pushViewController:VC animated:true];
}

-(void)viewWillAppear:(BOOL)animated
{

    [self.navigationController setNavigationBarHidden:false animated:animated];
}


@end
