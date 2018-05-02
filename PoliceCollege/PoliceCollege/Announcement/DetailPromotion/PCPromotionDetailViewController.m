//
//  PCPromotionDetailViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCPromotionDetailViewController.h"
#import "PCPromotionTextTableViewCell.h"
@interface PCPromotionDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PCPromotionDetailViewController {
    UITableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [self.navigationController setNavigationBarHidden:true animated:true];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"promotionDetailCell";
    PCPromotionTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell = [[PCPromotionTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(15, 5, 30, 30)];
    [cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:cancelButton];
    return cell;
}

- (void)cancel {
    [self.navigationController popViewControllerAnimated:true];
}





















@end
