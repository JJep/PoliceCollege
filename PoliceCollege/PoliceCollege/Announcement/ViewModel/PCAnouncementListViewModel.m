//
//  PCPromotionListViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/4.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCAnouncementListViewModel.h"

@implementation PCAnouncementListViewModel

- (void)getFirstPromotionListAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    [self getPromotionListActionWithCurrentPage:[NSNumber numberWithInt:1] success:success fail:fail];
}

- (void)getPromotionListActionWithCurrentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    //设置相关网络请求
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    //设置request的类型为post
    request.requstType = @"post";
    //设置请求的接口
    request.apiString = @"newsSearchByTypeAjax";
    //设置请求的参数
    NSMutableDictionary *paraDic = [[NSMutableDictionary alloc]
                                    initWithDictionary:@{
                                                         @"type":@0,//默认type为0
                                                         @"page.currentPage":currentPage
                                                         }];
    request.paraDict = paraDic;
    //发送请求
    [request sendRequestSuccess:success error:fail];
}

- (void)getDetailAnnouncementActionWithID:(NSNumber *)announcementID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"get";
    request.apiString = @"newsSearchInfo";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"id":announcementID
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}
@end
