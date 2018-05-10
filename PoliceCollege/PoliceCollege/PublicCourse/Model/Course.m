//
//  Course.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "Course.h"
NSString *const kCourseListCcredit = @"ccredit";
NSString *const kCourseListCommentNum = @"commentNum";
NSString *const kCourseListCredit = @"credit";
NSString *const kCourseListHit = @"hit";
NSString *const kCourseListIdField = @"id";
NSString *const kCourseListImg = @"img";
NSString *const kCourseListPublished = @"published";
NSString *const kCourseListTitle = @"title";

@interface Course ()
@end
@implementation Course
-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCourseListCcredit] isKindOfClass:[NSNull class]]){
        self.ccredit = [dictionary[kCourseListCcredit] floatValue];
    }
    
    if(![dictionary[kCourseListCommentNum] isKindOfClass:[NSNull class]]){
        self.commentNum = [dictionary[kCourseListCommentNum] integerValue];
    }
    
    if(![dictionary[kCourseListCredit] isKindOfClass:[NSNull class]]){
        self.credit = [dictionary[kCourseListCredit] integerValue];
    }
    
    if(![dictionary[kCourseListHit] isKindOfClass:[NSNull class]]){
        self.hit = [dictionary[kCourseListHit] integerValue];
    }
    
    if(![dictionary[kCourseListIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kCourseListIdField] integerValue];
    }
    
    if(![dictionary[kCourseListImg] isKindOfClass:[NSNull class]]){
        self.img = dictionary[kCourseListImg];
    }
    if(![dictionary[kCourseListPublished] isKindOfClass:[NSNull class]]){
        self.published = dictionary[kCourseListPublished];
    }
    if(![dictionary[kCourseListTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kCourseListTitle];
    }
    return self;
}
@end
