//
//  PublicCourseTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicCourseTableViewCell : UITableViewCell
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *subTitle;
@property (nonatomic,retain)UIImage *image;
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *commentsNum;
@end
