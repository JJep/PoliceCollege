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

@implementation SearchViewController (NetWork)

- (void)afGetList {
    [self.searchViewModel afGetListWithType:self.typeNumber title:self.searchBar.text currentPage:[NSNumber numberWithInteger:self.currentPage] success:^(id responseObject) {
        switch ([self.typeNumber integerValue]) {
            case learningBookType:
            {
                [self.dataArray removeAllObjects];
                NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Book class] json:[responseObject objectForKey:@"bookList"]];
                [self.dataArray addObjectsFromArray:tempAry];
                self.currentPage = 2;
                [self updateUI];
                break;
            }
            case learningVideoType:
            {
                [self.dataArray removeAllObjects];
                NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Video class] json:[responseObject objectForKey:@"videoList"]];
                [self.dataArray addObjectsFromArray:tempAry];
                self.currentPage = 2;
                [self updateUI];
                break;
            }
            case learningCourseType:
            {
                [self.dataArray removeAllObjects];
                NSArray *tempAry = [NSArray yy_modelArrayWithClass:[Course class] json:[responseObject objectForKey:@"courseList"]];
                [self.dataArray addObjectsFromArray:tempAry];
                self.currentPage = 2;
                [self updateUI];
                break;
            }
            default:
                break;
        }
    } fail:^(NSError *error) {
        
    }];
}

@end
