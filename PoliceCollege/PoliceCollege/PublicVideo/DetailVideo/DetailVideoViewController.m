//
//  DetailVideoViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "DetailVideoViewController.h"
#import "VideoViewModel.h"
#import "WebVideoViewController.h"
#import "DetailVideoTableViewCell.h"
@interface DetailVideoViewController () <UITableViewDataSource, UITableViewDelegate>

@end
static NSString *cellID = @"detailVideoCell";
@implementation DetailVideoViewController{
    UITableView *tableView;
    VideoViewModel *videoViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self initData];
    [self getDetailCourse];
}

- (void)initData {
    videoViewModel = [VideoViewModel new];
}

- (void)getDetailCourse {
    [videoViewModel getDetailVideoAction:[NSNumber numberWithInteger:self.idField] success:^(id responseObject) {
        self.model = [DetailVideo yy_modelWithJSON:[responseObject objectForKey:@"video"]];
        [self updateUI];
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)updateUI {
    [tableView reloadData];
}

- (void)initViews {
    tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[DetailVideoTableViewCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    [cell setModel:self.model];
    [cell.playButton addTarget:self action:@selector(playVideo:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)playVideo:(UIButton *)button {
    WebVideoViewController *webVideoViewcontroller = [WebVideoViewController new];
    webVideoViewcontroller.URLString = self.model.videoUrl;
    [self.navigationController pushViewController:webVideoViewcontroller animated:true];
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
