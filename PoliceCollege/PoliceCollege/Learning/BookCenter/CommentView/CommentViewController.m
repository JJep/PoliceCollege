//
//  CommentViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentTableViewCell.h"
@interface CommentViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation CommentViewController {
    UITableView *tableView;
    UIButton *commentButton;
    NSMutableArray *commentListArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self initData];
}

- (void)initData {
    commentListArray = [NSMutableArray new];
}

- (void)initViews {
    tableView = [[UITableView alloc] init];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self->commentButton);
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView registerClass:[CommentTableViewCell class] forCellReuseIdentifier:@"commentCell"];
    
    commentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [commentButton setTitle:@"评论" forState:UIControlStateNormal];
    [commentButton addTarget:self action:@selector(comment:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commentButton];
    [commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
}

- (void)comment:(UIButton *)button {
    
}

#pragma tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return commentListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    [cell setModel:commentListArray[indexPath.row]];
    return cell;
}

#pragma tableViewDelegate

@end
