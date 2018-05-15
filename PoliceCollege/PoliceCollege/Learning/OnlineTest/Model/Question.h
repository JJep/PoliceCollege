//
//  Question.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/14.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
@property (nonatomic, strong) NSString * answer;
@property (nonatomic, strong) NSString * authentication;
@property (nonatomic, strong) NSString * difficulty;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * isdelete;
@property (nonatomic, strong) NSString * options;
@property (nonatomic, strong) NSString * stem; //题目
@property (nonatomic, assign) NSInteger rscore;
@property (nonatomic, strong) NSString *optionIndex;


@end
