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
@interface SearchViewController () <UISearchBarDelegate, UITableViewDelegate>
@property (nonatomic, retain)UISearchBar *searchBar;
@property (nonatomic, retain)NSNumber *typeNumber;
@property (nonatomic, retain)SearchViewModel *searchViewModel;
@property (nonatomic, assign)NSUInteger currentPage;
@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)PCDataSource *searchTableViewDataSource;
@property (nonatomic, retain)NSMutableArray *dataArray;
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
    self.tableView.delegate = self;
    self.tableView.dataSource = self.searchTableViewDataSource;
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
    [self afGetList];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.currentPage = 1;
}

- (void)afGetList {
    [self.searchViewModel afGetListWithTitle:self.searchBar.text type:self.typeNumber currentPage:[NSNumber numberWithInteger:self.currentPage] success:^(id responseObject) {
        
    } fail:^(NSError *error) {
        
    }];
}

@end
