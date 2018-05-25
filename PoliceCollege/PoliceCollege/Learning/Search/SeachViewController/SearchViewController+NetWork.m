//
//  SearchViewController+NetWork.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchViewController+NetWork.h"
#import "Video.h"
#import "Book.h"
#import "Course.h"
#import "SearchViewModel.h"
#import <MJRefresh.h>
@implementation SearchViewController (NetWork)

- (void)afGetList {
    [self.searchViewModel afGetListWithType:self.typeNumber title:self.searchBar.text currentPage:[NSNumber numberWithInteger:self.currentPage] success:^(id responseObject) {
        if (self.currentPage == 1) {
            [self.dataArray removeAllObjects];
        }
        NSArray *tempAry;
        switch ([self.typeNumber integerValue]) {
            case learningBookType:
                tempAry = [NSArray yy_modelArrayWithClass:[Book class] json:[responseObject objectForKey:@"bookList"]];
                break;
            case learningVideoType:
                tempAry = [NSArray yy_modelArrayWithClass:[Video class] json:[responseObject objectForKey:@"videoList"]];
                break;
            case learningCourseType:
                tempAry = [NSArray yy_modelArrayWithClass:[Course class] json:[responseObject objectForKey:@"courseList"]];
                break;
            default:
                break;
        }
        self.totalPage = [[responseObject objectForKey:@"sumPage"] intValue];
        if (self.currentPage == self.totalPage) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self.tableView.mj_footer endRefreshing];
            self.currentPage ++;
        }
        [self.dataArray addObjectsFromArray:tempAry];
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
}

@end
