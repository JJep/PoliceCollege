//
//  SelectedCoursesView.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/27.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Overview.h"
typedef NS_ENUM(NSInteger, OverviewStyle) {
    OverviewVideoStyle,
    OverviewCourseStyle
};
@interface SelectedCoursesView : UIView
@property(nonatomic,retain)UILabel *selectedCoursesTitleLabel;
- (void)setModel:(Overview *)model withStyle:(OverviewStyle)style;
@end
