//
//  VideoViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "VideoViewModel.h"

@implementation VideoViewModel
- (void)getFirstRecommendedVideoListAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"videoSearchByRecommended";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"page.currentPage":@1
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

- (void)getMoreREcommendedVideoListAction:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"videoSearchByRecommended";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"page.currentPage":currentPage
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

-(void)getDetailVideoAction:(NSNumber *)courseID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"videoSearchInfo";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"id":courseID
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}
@end
