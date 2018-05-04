//
//  JMUserLocalData.m
//  JMBoilerPlatform
//
//  Created by Chendong on 2018/4/9.
//  Copyright © 2018年 chendong. All rights reserved.
//

#import "JMUserLocalData.h"

#define localLogin @"isLogin"
#define localUser @"user"
#define localCookie @"cookie"
#define localUserInfo @"userInfo"
@implementation JMUserLocalData

+ (instancetype)sharedManager {
    static JMUserLocalData* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

-(void)setCookie:(NSString *)cookie
{
    [[NSUserDefaults standardUserDefaults] setObject:cookie forKey:localCookie];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)cookie {
    return [[NSUserDefaults standardUserDefaults] objectForKey:localCookie] ;
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

-(void)setUserInfo:(UserInfo *)userInfo {
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:userInfo];
    [[NSUserDefaults standardUserDefaults] setObject:myEncodedObject forKey:localUserInfo];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (UserInfo *)userInfo {
    UserInfo *obj = (UserInfo *)[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:localUserInfo]];
    return obj;
}

-(void)setUser:(User *)user
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    [[NSUserDefaults standardUserDefaults] setObject:myEncodedObject forKey:localUser];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(User *)user
{
    User *obj = (User *)[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:localUser]];
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
