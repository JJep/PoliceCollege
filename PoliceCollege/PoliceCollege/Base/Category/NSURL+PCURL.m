//
//  NSURL+PCURL.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/7.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "NSURL+PCURL.h"

@implementation NSURL (PCURL)
+ (NSURL *)pc_imageURLWithString:(NSString *)string {
    NSURL *url = [[NSURL alloc] init];
    NSString *baseURL = @"http://139.224.208.224/NetworkCollege-app";
    url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", [baseURL substringWithRange:NSMakeRange(0, baseURL.length - 5)], string]];
    return url;
}
@end
