//
//  PublicVideoViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PublicVideoViewController.h"
#import "VideoViewModel.h"
#import "BackView.h"
#import "Video.h"
#import <MJRefresh.h>
#import "PublicVideoTableViewCell.h"
#import "DetailVideoViewController.h"
@interface PublicVideoViewController () <UITableViewDelegate, UITableViewDataSource>

@end
static NSString *cellID = @"videoCell";
@implementation PublicVideoViewController {
    UITableView *tableView;
    NSMutableArray *videoArray;
    int currentPage;
    int totalPage;
    VideoViewModel *videoViewModel;
    BackView *backView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self initData];
    [self getFirstCourseList];
    
}

- (void)getMoreCourseList {
    [videoViewModel getMoreREcommendedVideoListAction:[NSNumber numberWithInt:currentPage] success:^(id responseObject) {
                NSArray *tempArray = [NSArray yy_modelArrayWithClass:[Video class] json:[responseObject objectForKey:@"videoList"]];
//        NSArray *ary = [responseObject objectForKey:@"courseList"];
//        [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            Video *video = [[Video alloc] initWithDictionary:obj];
//            [self->videoArray addObject:video];
//        }];
                [self->videoArray addObjectsFromArray:tempArray];
        
        self->totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
        if (self->currentPage == self->totalPage) {
            [self->tableView.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self->tableView.mj_footer endRefreshing];
            self->currentPage ++;
        }
        [self updateUI];
    } fail:^(NSError *error) {
        NSLog(@"网络错误");
    }];
}

- (void)getFirstCourseList {
    [videoViewModel getFirstRecommendedVideoListAction:^(id responseObject) {
        if ([[responseObject objectForKey:@"state"] isEqualToString:@"1"]) {
                        NSArray *tempArray = [NSArray yy_modelArrayWithClass:[Video class] json:[responseObject objectForKey:@"videoList"]];
                        [self->videoArray addObjectsFromArray:tempArray];
//            NSArray *ary = [responseObject objectForKey:@"courseList"];
//            [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                Course *course = [[Course alloc] initWithDictionary:obj];
//                [self->courseArray addObject:course];
//            }];
            self->totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
            self->currentPage = 2;
            [self updateUI];
        } else {
            NSLog(@"服务器错误");
        }
    } fail:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)updateUI {
    if (videoArray.count == 0) {
        [tableView setHidden:true];
    } else {
        [tableView setHidden:false];
    }
    [tableView reloadData];
}

- (void)initData {
    videoArray = [NSMutableArray new];
    currentPage = 1;
    videoViewModel = [VideoViewModel new];
}

- (void)initViews {
    
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    
    backView = [[BackView alloc] initWithFrame:self.view.bounds];
    [backView setImage:[UIImage imageNamed:@"video"]];
    [backView setName:@"暂无公开视频"];
    [self.view addSubview:backView];
    
    self.title = @"公开视频";
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self getMoreCourseList];
    }];
    [backView addSubview:tableView];
    
    [tableView setHidden:true];
    
    [tableView registerClass:[PublicVideoTableViewCell class] forCellReuseIdentifier:cellID];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return videoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PublicVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    [cell setModel:videoArray[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailVideoViewController *detailVideoViewController = [DetailVideoViewController new];
    detailVideoViewController.idField = ((Video *)videoArray[indexPath.row]).idField;
    NSLog(@"%ld", (long)((Video *)videoArray[indexPath.row]).idField);
    [self.navigationController pushViewController:detailVideoViewController animated:true];
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
