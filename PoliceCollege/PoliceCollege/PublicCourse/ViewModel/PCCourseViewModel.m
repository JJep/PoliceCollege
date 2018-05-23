//
//  PCCourseViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/9.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCCourseViewModel.h"

@implementation PCCourseViewModel
- (void)getFirstRecommendedCourseListAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"courseSearchByRecommended";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"page.currentPage":@1
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

- (void)getMoreREcommendedCourseListAction:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"courseSearchByRecommended";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"page.currentPage":currentPage
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

-(void)getDetailCourseAction:(NSNumber *)courseID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"courseSearchInfo";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"id":courseID
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

- (void)downloadSelectedCourseWithCurrentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    request.requstType = @"post";
    request.apiString = @"learnrecord";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"type":@1,
                                                                                  @"page.currentPage":currentPage
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

@end
