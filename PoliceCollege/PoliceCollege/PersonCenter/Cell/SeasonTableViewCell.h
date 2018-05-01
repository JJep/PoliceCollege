//
//  SeasonTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/28.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeasonCreditModel.h"
@class SeasonSubview;
@interface SeasonTableViewCell : UITableViewCell
@property (nonatomic,retain)SeasonCreditModel *model;
@property (nonatomic,assign)BOOL isSelected;
@property (nonatomic,retain)SeasonSubview *seasonSubview;

@end
