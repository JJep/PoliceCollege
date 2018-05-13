//
//  MyChannel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/11.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyChannel : NSObject
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSArray * params;

+ (NSDictionary *)modelCustomPropertyMapper ;

@end
