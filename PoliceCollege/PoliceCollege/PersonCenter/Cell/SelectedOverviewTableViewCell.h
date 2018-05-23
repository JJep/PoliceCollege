//
//  SelectedOverviewTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef NS_ENUM(NSInteger, OverviewStyle) {
//    OverviewVideoStyle,
//    OverviewCourseStyle,
//    OverviewBookStyle
//};
@interface SelectedOverviewTableViewCell : UITableViewCell
@property(nonatomic,retain)UILabel *selectedCoursesTitleLabel;
- (void)setModel:(id)model;
@end
