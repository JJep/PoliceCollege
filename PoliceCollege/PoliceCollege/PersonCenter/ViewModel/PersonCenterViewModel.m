//
//  PersonCenterViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PersonCenterViewModel.h"

@implementation PersonCenterViewModel
- (void)getRankingAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    //设置相关网络请求
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    //设置request的类型为post
    request.requstType = @"get";
    //设置请求的接口
    request.apiString = @"myRanking";
    //发送请求
    [request sendRequestSuccess:success error:fail];
}

-(void)getCurrentSeasonCreditInfoAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    //设置相关网络请求
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    //设置request的类型为post
    request.requstType = @"get";
    //设置请求的接口
    request.apiString = @"learnSearchByAjax";
    //发送请求
    [request sendRequestSuccess:success error:fail];
}

-(void)getFourSeasonsCreditActionWithYear:(NSNumber *)year success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    //设置相关网络请求
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    //设置request的类型为post
    request.requstType = @"get";
    //设置请求的接口
    request.apiString = @"oneYearScoreSituation";
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"year":year
                                                                                  }];
    //发送请求
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

- (void)getLearningOverviewAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    request.requstType = @"get";
    request.apiString = @"learnOverview";
    [request sendRequestSuccess:success error:fail];
}

@end
