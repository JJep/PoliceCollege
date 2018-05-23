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
    NSURL *url ;
    NSString *baseURL = @"http://139.224.208.224/NetworkCollege/";
    url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseURL,  string]];
    return url;
}

+ (NSURL *)pc_contentURLWithString:(NSString *)string {
    NSURL *url;
    NSString *baseURL = @"http://139.224.208.224/NetworkCollege/";
//    url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseURL, [string substringWithRange:[NSMakeRange(7, string.length-7)]]]]];
    url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseURL,[string substringWithRange:NSMakeRange(7, string.length-7)]]];
    return url;
}

+(NSURL *)pc_videoURLWithString:(NSString *)string {
    NSString *baseURL = @"http://139.224.208.224/NetworkCollege/";
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", baseURL, string];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:URLPathAllowedCharacterSet]
    NSURL *url = [NSURL URLWithString:urlStr];
    return url;
}
@end
