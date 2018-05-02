//
//  PCNetworkResponseSerializer.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCResponseSerializer.h"

@implementation PCResponseSerializer


- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    id responseObject = [super responseObjectForResponse:response data:data error:error];
    
    return responseObject;
}


@end
