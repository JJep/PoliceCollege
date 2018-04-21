//
//  MeViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MeViewController.h"
#import "MeTableViewCellFactory.h"
#import "MeTableViewModel.h"
#import "MeTableViewCell.h"
@interface MeViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,retain)NSArray *dataArray;
@end

@implementation MeViewController {
//    MeTableView *meView;
    UITableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self initDataArray];
    
}

- (void)initDataArray {
    
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
    MeTableViewModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
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
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
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
