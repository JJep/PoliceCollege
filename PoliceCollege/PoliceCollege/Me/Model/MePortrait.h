//
//  PortraitModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/21.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MeTableViewModel.h"

@interface MePortrait : MeTableViewModel
@property (nonatomic,retain)NSURL *portraitURL;
@property (nonatomic,copy)NSString *userName;
@property (nonatomic)float totalTime;
@property (nonatomic)float todayTime;
@end
