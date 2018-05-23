//
//  Overview.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/14.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VideoOverview.h"
#import "BookOverview.h"
#import "CourseOverview.h"
@interface Overview : NSObject
@property (nonatomic, strong) BookOverview * book;
@property (nonatomic, strong) CourseOverview * course;
@property (nonatomic, strong) VideoOverview * video;

@end
