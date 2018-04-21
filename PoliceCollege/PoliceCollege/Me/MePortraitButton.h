//
//  MePortraitButton.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MePortraitButton : UIButton
@property (nonatomic,retain)UIImage *image;
@property (nonatomic,copy)NSString *nameStr;
@property (nonatomic)float totalTime;
@property (nonatomic)float todayTime;
@end
