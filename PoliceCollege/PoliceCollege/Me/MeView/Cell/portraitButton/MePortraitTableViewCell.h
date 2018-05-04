//
//  MePortraitButton.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeTableViewCell.h"
#import "MePortrait.h"
@interface MePortraitTableViewCell : MeTableViewCell
@property (nonatomic,retain)NSURL *imageURL;
@property (nonatomic,copy)NSString *nameStr;
@property (nonatomic)float totalTime;
@property (nonatomic)float todayTime;
@end
