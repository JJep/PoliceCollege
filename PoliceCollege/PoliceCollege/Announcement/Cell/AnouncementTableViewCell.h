//
//  AnouncementTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCAnnouncementModel.h"
@interface AnouncementTableViewCell : UITableViewCell
@property (nonatomic,retain)UIImage *image;
@property (nonatomic,copy)NSString *titleStr;
@property (nonatomic,copy)NSString *timeStr;
@property (nonatomic)int commentsNum;

- (void)setModel:(PCAnnouncementModel *)model;
@end
