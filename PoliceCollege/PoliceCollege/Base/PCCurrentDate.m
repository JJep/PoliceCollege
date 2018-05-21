//
//  PCCurrentDate.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCCurrentDate.h"

@implementation PCCurrentDate
- (instancetype)init {
    if (self = [super init]) {
        NSDate *now = [NSDate date];
        NSLog(@"now date is: %@", now);
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
        
        self.year = [dateComponent year];
        self.month = [dateComponent month];
        self.day = [dateComponent day];
        self.hour = [dateComponent hour];
        self.minute = [dateComponent minute];
        self.second = [dateComponent second];
    }
    return self;
}
@end
