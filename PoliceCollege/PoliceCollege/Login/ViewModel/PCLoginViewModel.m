//
//  PCRegisterModelView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCLoginViewModel.h"

@implementation PCLoginViewModel
-(void)loginAction:(NSString *)userName password:(NSString *)password success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    //设置相关网络请求
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    //设置request解析的model类型
    request.modelName = @"User";
    //设置request的类型为post
    request.requstType = @"post";
    //设置请求的接口
    request.apiString = @"ajaxLogined";
    //设置请求的参数
    NSMutableDictionary *paraDic = [[NSMutableDictionary alloc]
                                    initWithDictionary:@{
                                                         @"loginName":userName,
                                                         @"loginPwd":password
                                                         }];
    request.paraDict = paraDic;
    //发送请求
    [request sendRequestSuccess:success error:fail];
   
}
@end
