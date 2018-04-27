//
//  BookDetailViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "BookDetailViewController.h"
#import "BookIntroductionTableViewCell.h"
#import "BookModel.h"
#import "BookTableViewCell.h"
@interface BookDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation BookDetailViewController {
    UITableView *tableView;
    BookModel *bookModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"图书详情";
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.estimatedRowHeight = 205;
    tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else {
        return bookModel.bookChapters.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookCell"];
        cell = [[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookCell"];
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];
        return cell;
    } else if (indexPath.section == 1) {
        BookIntroductionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introductionCell"];
        cell = [[BookIntroductionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"introductionCell"];
        [cell setContent:bookModel.bookIntroduction];
        return cell;
    } else {
        BookIntroductionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introductionCell"];
        cell = [[BookIntroductionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"chapterCell"];
        [cell setContent:bookModel.bookChapters[indexPath.row]];
        return cell;
    }
}

@end
