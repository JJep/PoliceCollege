//
//  JMUserLocalData.m
//  JMBoilerPlatform
//
//  Created by Chendong on 2018/4/9.
//  Copyright © 2018年 chendong. All rights reserved.
//

#import "JMUserLocalData.h"

#define localLogin @"isLogin"
#define localUserInfo @"userinfo"

@implementation JMUserLocalData

+ (instancetype)sharedManager {
    static JMUserLocalData* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

-(void)setIsLogin:(BOOL)isLogin
{
    [[NSUserDefaults standardUserDefaults] setBool:isLogin forKey:localLogin];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(BOOL)isLogin
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:localLogin] boolValue];
}

-(void)setUserid:(NSInteger)userid
{
    [[NSUserDefaults standardUserDefaults] setInteger:userid forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSInteger)userid
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"userid"] integerValue];
}

-(void)setUsermodel:(UserInfo *)usermodel
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:usermodel];
    [[NSUserDefaults standardUserDefaults] setObject:myEncodedObject forKey:localUserInfo];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(UserInfo *)usermodel
{
    UserInfo *obj = (UserInfo *)[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:localUserInfo]];
    return obj;
}

+(void)removeAllLocalData
{
    NSUserDefaults *defatluts = [NSUserDefaults standardUserDefaults];
    NSDictionary *dictionary = [defatluts dictionaryRepresentation];
    for(NSString *key in [dictionary allKeys]){
        [defatluts removeObjectForKey:key];
        [defatluts synchronize];
    }
}

@end
