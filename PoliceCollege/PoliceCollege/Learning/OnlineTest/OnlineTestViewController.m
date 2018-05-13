//
//  OnlineTestViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "OnlineTestViewController.h"
#import "OnlineTestCollectionViewCell.h"
#import "TestViewController.h"
#import "TestPaper.h"
@interface OnlineTestViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation OnlineTestViewController {
    UITableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    self.title = @"党员学习";
    
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.paperArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"testCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if ( cell == nil )  {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = ((TestPaper *)self.paperArray[indexPath.row]).title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TestViewController *newVC = [TestViewController new];
    [self.navigationController pushViewController:newVC animated:true];
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
