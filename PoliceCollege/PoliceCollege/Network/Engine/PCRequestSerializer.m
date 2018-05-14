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
    //在请求头添加token
    if ([JMUserLocalData sharedManager].authorization) {
        NSLog(@"---------/n%@/n---------",[JMUserLocalData sharedManager].authorization);
        [request setValue:[JMUserLocalData sharedManager].authorization forHTTPHeaderField:@"Authorization"];
    }
    
    return request;
}
@end
