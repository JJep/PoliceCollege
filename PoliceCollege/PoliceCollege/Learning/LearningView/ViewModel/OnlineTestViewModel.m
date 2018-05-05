//
//  OnlineTestViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/5.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "OnlineTestViewModel.h"

@implementation OnlineTestViewModel
- (void)getTestPapersAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    //设置相关网络请求
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    //设置request的类型为post
    request.requstType = @"get";
    //设置请求的接口
    request.apiString = @"testpaperSearchByAjax";
    //发送请求
    [request sendRequestSuccess:success error:fail];
}
@end
