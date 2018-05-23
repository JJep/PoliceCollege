//
//  ThematicCenterViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/21.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "ThematicCenterViewController.h"
#import "AnnouncementDataSource.h"

static NSString* const cellID = @"ThemeCell";

@interface ThematicCenterViewController () <UITableViewDelegate>
@property (nonatomic,retain)AnnouncementDataSource *dataSource;
@end

@implementation ThematicCenterViewController {
    UITableView *tableView;
    NSMutableArray *themeArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initViews];
}

- (void)initViews {
    tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self.dataSource;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)initData {
    themeArray = [[NSMutableArray alloc] init];
    self.dataSource = [[AnnouncementDataSource alloc] initWithItems:themeArray cellIdentifier:cellID configureCellBlock:^(id cell, id item) {
        
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
