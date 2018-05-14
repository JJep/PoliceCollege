//
//  Quarter.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quarter : NSObject
@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, assign) NSInteger must;
@property (nonatomic, assign) NSInteger sum;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary ;
@end
