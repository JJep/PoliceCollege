//
//  PublicCourseViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PublicCourseViewController.h"
#import "PublicCourseTableViewCell.h"
@interface PublicCourseViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PublicCourseViewController {
    UITableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"公开课程";
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"publicCourseCell";
    PublicCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell = [[PublicCourseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

-(void)viewWillAppear:(BOOL)animated {
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
