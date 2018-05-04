//
//  JMUserLocalData.h
//  JMBoilerPlatform
//
//  Created by Chendong on 2018/4/9.
//  Copyright © 2018年 chendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "UserInfo.h"
@interface JMUserLocalData : NSObject

@property(nonatomic,assign) BOOL isLogin;
@property(nonatomic,retain) NSString *cookie;
@property(nonatomic,strong) User *user;
@property(nonatomic,retain) UserInfo *userInfo;

+ (instancetype)sharedManager;
+ (void)removeAllLocalData;

@end
