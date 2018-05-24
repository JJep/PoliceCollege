//
//  VideoTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/27.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchTableViewCell.h"
#import "Video.h"
@interface VideoTableViewCell : SearchTableViewCell
- (void)setModel:(Video *)model;
@end
