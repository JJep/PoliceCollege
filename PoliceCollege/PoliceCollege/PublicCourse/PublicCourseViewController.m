//
//  PublicCourseViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PublicCourseViewController.h"
#import "PublicCourseTableViewCell.h"
#import "PCCourseViewModel.h"
#import "Course.h"
#import <MJRefresh.h>
#import "BackView.h"
#import "DetailCourseViewController.h"
@interface PublicCourseViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PublicCourseViewController {
    UITableView *tableView;
    NSMutableArray *courseArray;
    int currentPage;
    int totalPage;
    PCCourseViewModel *courseViewModel;
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
    [courseViewModel getMoreREcommendedCourseListAction:[NSNumber numberWithInt:currentPage] success:^(id responseObject) {
//        NSArray *tempArray = [NSArray yy_modelArrayWithClass:[Course class] json:[responseObject objectForKey:@"courseList"]];
        NSArray *ary = [responseObject objectForKey:@"courseList"];
        [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Course *course = [[Course alloc] initWithDictionary:obj];
            [self->courseArray addObject:course];
        }];
//        [self->courseArray addObjectsFromArray:tempArray];
        
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
    [courseViewModel getFirstRecommendedCourseListAction:^(id responseObject) {
        if ([[responseObject objectForKey:@"state"] isEqualToString:@"1"]) {
//            NSArray *tempArray = [NSArray yy_modelArrayWithClass:[Course class] json:[responseObject objectForKey:@"courseList"]];
//            [self->courseArray addObjectsFromArray:tempArray];
            NSArray *ary = [responseObject objectForKey:@"courseList"];
            [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                Course *course = [[Course alloc] initWithDictionary:obj];
                [self->courseArray addObject:course];
            }];
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
    if (courseArray.count == 0) {
        [tableView setHidden:true];
    } else {
        [tableView setHidden:false];
    }
    [tableView reloadData];
}

- (void)initData {
    courseArray = [NSMutableArray new];
    currentPage = 1;
    courseViewModel = [PCCourseViewModel new];
}

- (void)initViews {
    
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    
    backView = [[BackView alloc] initWithFrame:self.view.bounds];
    [backView setImage:[UIImage imageNamed:@"video"]];
    [backView setName:@"暂无公开课程"];
    [self.view addSubview:backView];
    
    self.title = @"公开课程";
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self getMoreCourseList];
    }];
    [backView addSubview:tableView];
    
    [tableView setHidden:true];
    
    [tableView registerClass:[PublicCourseTableViewCell class] forCellReuseIdentifier:@"publicCourseCell"];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return courseArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"publicCourseCell";
    PublicCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    [cell setModel:courseArray[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO];
    DetailCourseViewController *detailCourseViewController = [DetailCourseViewController new];
    detailCourseViewController.idField = ((Course *)courseArray[indexPath.row]).idField;
    [self.navigationController pushViewController:detailCourseViewController animated:true];
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
