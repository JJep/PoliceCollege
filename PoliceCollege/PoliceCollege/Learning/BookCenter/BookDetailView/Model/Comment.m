//
//  Comment.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/14.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "Comment.h"

@implementation Comment
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"nameComment":@"name_comment",
             @"imgComment":@"img_comment"
             };
}
@end
