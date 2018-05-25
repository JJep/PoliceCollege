//
//  SearchViewController.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, LearningCenterType) {
    learningCourseType = 3,
    learningVideoType = 5,
    learningBookType = 4
};
@class SearchViewModel;
@class PCDataSource;
@interface SearchViewController : UIViewController
@property (nonatomic, retain)SearchViewModel *searchViewModel;
@property (nonatomic, retain)UISearchBar *searchBar;
@property (nonatomic, retain)NSNumber *typeNumber;
@property (nonatomic, assign)NSUInteger currentPage;
@property (nonatomic, assign)NSUInteger totalPage;
@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)PCDataSource *searchTableViewDataSource;
@property (nonatomic, retain)NSMutableArray *dataArray;

- (instancetype)initWithType:(NSNumber *)type;
- (void)updateUI;
@end
