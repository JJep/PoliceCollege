//
//  SeasonCredit.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quarter.h"
@interface SeasonCredit : NSObject
@property (nonatomic, strong) Quarter * quarter1;
@property (nonatomic, strong) Quarter * quarter2;
@property (nonatomic, strong) Quarter * quarter3;
@property (nonatomic, strong) Quarter * quarter4;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
