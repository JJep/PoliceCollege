//
//  Quarter.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "Quarter.h"


NSString *const kQuarter1Comment = @"comment";
NSString *const kQuarter1Must = @"must";
NSString *const kQuarter1Sum = @"sum";

@interface Quarter ()
@end
@implementation Quarter




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kQuarter1Comment] isKindOfClass:[NSNull class]]){
        self.comment = [dictionary[kQuarter1Comment] integerValue];
    }
    
    if(![dictionary[kQuarter1Must] isKindOfClass:[NSNull class]]){
        self.must = [dictionary[kQuarter1Must] integerValue];
    }
    
    if(![dictionary[kQuarter1Sum] isKindOfClass:[NSNull class]]){
        self.sum = [dictionary[kQuarter1Sum] integerValue];
    }
    
    return self;
}



@end
