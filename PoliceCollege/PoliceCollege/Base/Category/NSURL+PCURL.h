//
//  NSURL+PCURL.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/7.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (PCURL)
+ (NSURL *)pc_imageURLWithString:(NSString *)string;
+ (NSURL *)pc_videoURLWithString:(NSString *)string;
+ (NSURL *)pc_contentURLWithString:(NSString *)string ;
@end
