//
//  JMUserLocalData.h
//  JMBoilerPlatform
//
//  Created by Chendong on 2018/4/9.
//  Copyright © 2018年 chendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

@interface JMUserLocalData : NSObject

@property(nonatomic,assign) BOOL isLogin;
@property(nonatomic,strong) UserInfo *usermodel;
@property(nonatomic,assign) NSInteger userid;
@property(nonatomic,strong) NSString *account;


+ (instancetype)sharedManager;
+ (void)removeAllLocalData;

@end
