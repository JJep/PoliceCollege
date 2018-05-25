//
//  SearchViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchViewModel.h"
#import "PCDataSource.h"
#import "SearchTableViewCell.h"
#import "SearchModel.h"
#import "SearchTableViewCell+ConfigureWithModel.h"
#import "BookCenterTableViewCell.h"
#import "VideoTableViewCell.h"
#import "SearchViewController+NetWork.h"
#import "SearchViewController+PushViewController.h"
@interface SearchViewController () <UISearchBarDelegate, UITableViewDelegate, UIScrollViewDelegate>

@end

static NSString * const cellID = @"searchTableViewCell";

@implementation SearchViewController

- (instancetype)initWithType:(NSNumber *)type {
    if (self = [super init]) {
        self.typeNumber = type;
        self.searchViewModel = [[SearchViewModel alloc] init];
        self.searchBar = [[UISearchBar alloc] init];
        self.currentPage = 1;
        self.tableView = [[UITableView alloc] init];
        self.dataArray = [[NSMutableArray alloc] init];
        TableViewCellConfigureBlock block = ^(SearchTableViewCell *cell, SearchModel *model) {
            [cell configureWithModel:model];
        };
        self.searchTableViewDataSource = [[PCDataSource alloc] initWithItems:self.dataArray cellIdentifier:cellID configureCellBlock:block];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"搜索";

    [self setupSearchBar];
    [self setupTableView];
}

- (void)setupTableView {
    [self.view addSubview:self.tableView];
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self.searchTableViewDataSource;
    [self registerCell];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBar.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (void)registerCell {
    switch ([self.typeNumber integerValue]) {
        case learningBookType:
        case learningCourseType:
            [self.tableView registerClass:[BookCenterTableViewCell class] forCellReuseIdentifier:cellID];
            break;
        case learningVideoType:
            [self.tableView registerClass:[VideoTableViewCell class] forCellReuseIdentifier:cellID];
            break;
        default:
            break;
    }
}

- (void)setupSearchBar {
    self.searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(45);
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.currentPage = 1;
    [self.searchBar resignFirstResponder];
    [self afGetList];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchBar resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self pushViewControllerWithIndexPath:indexPath];
}

- (void)updateUI {
    [self.searchTableViewDataSource updateWithItems:self.dataArray];
    [self.tableView reloadData];
}

@end
