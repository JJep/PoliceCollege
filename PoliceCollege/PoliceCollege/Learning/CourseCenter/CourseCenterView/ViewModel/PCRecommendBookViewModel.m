//
//  PCRecommendBookViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/4.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCRecommendBookViewModel.h"

@implementation PCRecommendBookViewModel
- (void)getRecommendBooksAction:(NSInteger)num success:(PCSuccessHandler)success fail:(PCFailedHandler)fail{
    //设置相关网络请求
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    //设置request的类型为post
    request.requstType = @"post";
    //设置请求的接口
    request.apiString = @"bookSearchByRecommended";
    //设置请求的参数
    NSMutableDictionary *paraDic = [[NSMutableDictionary alloc]
                                    initWithDictionary:@{
                                                         @"num":[NSNumber numberWithInteger:num]
                                                         }];
    request.paraDict = paraDic;
    //发送请求
    [request sendRequestSuccess:success error:fail];
}
@end
