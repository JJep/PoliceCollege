//
//  SearchViewController+PushViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchViewController+PushViewController.h"
#import "DetailVideoViewController.h"
#import "BookDetailViewController.h"
#import "Book.h"
#import "Course.h"
#import "Video.h"
#import "DetailCourseViewController.h"
@implementation SearchViewController (PushViewController)
- (void)pushViewControllerWithIndexPath:(NSIndexPath *)indexPath {
    switch ([self.typeNumber integerValue]) {
        case learningVideoType:
        {
            DetailVideoViewController *detailVideoViewController = [DetailVideoViewController new];
            detailVideoViewController.idField = ((Video *)self.dataArray[indexPath.row]).idField;
            [self.navigationController pushViewController:detailVideoViewController animated:true];
        }
            break;
        case learningCourseType:
        {
            DetailCourseViewController *newVC = [[DetailCourseViewController alloc] init];
            newVC.idField = ((Course *)self.dataArray[indexPath.row]).idField;
            [self.navigationController pushViewController:newVC animated:true];
            break;
        }
        case learningBookType :
        {
            BookDetailViewController *newVC = [BookDetailViewController new];
            newVC.model = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:newVC animated:true];
        }
        default:
            break;
    }
}

@end
