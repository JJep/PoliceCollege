//
//  PCNetworkRequestSerializer.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCRequestSerializer.h"

@implementation PCRequestSerializer

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method URLString:(NSString *)URLString parameters:(id)parameters error:(NSError *__autoreleasing  _Nullable *)error
{
    NSMutableURLRequest *request = [super requestWithMethod:method URLString:URLString parameters:parameters error:error];
//    if ([JMUserLocalData sharedManager].isLogin) {
//        [request setValue:[JMUserLocalData sharedManager].usermodel.token forHTTPHeaderField:@"token"];
//    }
//    NSString *SeparatorStr = @"BM";
//    //设置HTTPHeader中Content-Type的值
//    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",SeparatorStr];
//    //设置HTTPHeader
//    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    if ([JMUserLocalData sharedManager].authorization) {
        NSLog(@"%@",[JMUserLocalData sharedManager].authorization);
        [request setValue:[JMUserLocalData sharedManager].authorization forHTTPHeaderField:@"Authorization"];
    }
    
    return request;
}
@end
