//
//  UserViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "UserViewModel.h"

@implementation UserViewModel
- (void)getUserInfoAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    //设置相关网络请求
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    //设置request的类型为post
    request.requstType = @"get";
    //设置请求的接口
    request.apiString = @"userInfo";
    //发送请求
    [request sendRequestSuccess:success error:fail];
}
@end
