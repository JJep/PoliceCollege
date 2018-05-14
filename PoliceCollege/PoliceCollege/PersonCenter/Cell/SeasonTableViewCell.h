//
//  SeasonTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/28.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeasonCredit.h"
@class SeasonSubview;
@interface SeasonTableViewCell : UITableViewCell
@property (nonatomic,assign)BOOL isSelected;
@property (nonatomic,retain)SeasonSubview *seasonSubview;
- (void)setModelWithSeason:(NSInteger)season model:(SeasonCredit *)model;

@end
