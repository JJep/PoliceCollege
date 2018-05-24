//
//  Course.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
@property (nonatomic, assign) CGFloat ccredit;
@property (nonatomic, assign) NSInteger commentNum;
@property (nonatomic, assign) NSInteger credit;
@property (nonatomic, assign) NSInteger hit;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * published;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, assign) NSInteger category;
@property (nonatomic, assign) BOOL complete;
@property (nonatomic, strong) NSObject * courseData;
@property (nonatomic, strong) NSString * duration;
@property (nonatomic, strong) NSString * durationInfo;
@property (nonatomic, strong) NSString * filename;
@property (nonatomic, strong) NSObject * learnTime;
@property (nonatomic, strong) NSObject * lid;
@property (nonatomic, assign) NSInteger percent;
@property (nonatomic, assign) NSInteger playType;
@property (nonatomic, strong) NSObject * progress;
@property (nonatomic, assign) NSInteger recommendNum;
@property (nonatomic, strong) NSObject * recommended;
@property (nonatomic, strong) NSObject * sid;
@property (nonatomic, assign) NSInteger state;
@property (nonatomic, strong) NSString * teacher;
@property (nonatomic, strong) NSString * teacherinfo;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString * typeName;
@property (nonatomic, strong) NSObject * user;
@property (nonatomic, strong) NSString * videoUrl;
@property (nonatomic, strong) NSObject * votes;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
