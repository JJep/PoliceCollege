//
//  NSObject+PropertyMapper.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/11.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "NSObject+PropertyMapper.h"

@implementation NSObject (PropertyMapper)
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"idField":@"id"};
}
@end
