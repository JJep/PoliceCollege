//
//  PushSettingViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PushSettingViewController.h"
#import "PushSettingTableViewCell.h"

static NSString* const cellIdentifier = @"PushSettingCell";

@interface PushSettingViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PushSettingViewController {
    UITableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[PushSettingTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PushSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:false];
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
