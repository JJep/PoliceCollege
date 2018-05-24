//
//  SeasonCredit.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SeasonCredit.h"
#import "Quarter.h"

NSString *const kQuarterScoreQuarter1 = @"quarter1";
NSString *const kQuarterScoreQuarter2 = @"quarter2";
NSString *const kQuarterScoreQuarter3 = @"quarter3";
NSString *const kQuarterScoreQuarter4 = @"quarter4";

@interface SeasonCredit ()
@end
@implementation SeasonCredit




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kQuarterScoreQuarter1] isKindOfClass:[NSNull class]]){
        self.quarter1 = [[Quarter alloc] initWithDictionary:dictionary[kQuarterScoreQuarter1]];
    }
    
    if(![dictionary[kQuarterScoreQuarter2] isKindOfClass:[NSNull class]]){
        self.quarter2 = [[Quarter alloc] initWithDictionary:dictionary[kQuarterScoreQuarter2]];
    }

    if(![dictionary[kQuarterScoreQuarter3] isKindOfClass:[NSNull class]]){
        self.quarter3 = [[Quarter alloc] initWithDictionary:dictionary[kQuarterScoreQuarter3]];
    }
    
    if(![dictionary[kQuarterScoreQuarter4] isKindOfClass:[NSNull class]]){
        self.quarter4 = [[Quarter alloc] initWithDictionary:dictionary[kQuarterScoreQuarter4]];
    }
    
    return self;
}


@end
