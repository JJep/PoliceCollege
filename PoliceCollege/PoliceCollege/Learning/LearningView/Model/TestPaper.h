//
//  TestPaper.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/5.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestPaper : NSObject
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) BOOL begin;
@property (nonatomic, assign) NSInteger category;
@property (nonatomic, strong) NSObject * endTime;
@property (nonatomic, assign) NSInteger goodScore;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger passingScore;
@property (nonatomic, strong) NSArray * questions;
@property (nonatomic, assign) NSInteger randomOption;
@property (nonatomic, strong) NSObject * startTime;
@property (nonatomic, strong) NSObject * time;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) NSInteger type;

@end
