//
//  PCChannelViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/5.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCChannelViewModel.h"

@implementation PCChannelViewModel
- (void)getMyChannelWithType:(NSNumber *)type success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"myParamset";
    NSMutableDictionary *paraDic = [[NSMutableDictionary alloc]
                                    initWithDictionary:@{
                                                         @"type":type
                                                         }];
    request.paraDict = paraDic;
    [request sendRequestSuccess:success error:fail];
}

- (void)getAllChannelsWithType:(NSNumber *)type success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"paramsetSearchByAjax";
    NSMutableDictionary *paraDic = [[NSMutableDictionary alloc]
                                    initWithDictionary:@{
                                                         @"type":type
                                                         }];
    request.paraDict = paraDic;
    [request sendRequestSuccess:success error:fail];
}

- (void)updateChannelWithType:(NSNumber *)type channelID:(NSNumber *)channelID newChannelsID:(NSString *)newChannelsID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"updateMyParamset";
    NSMutableDictionary *paraDic = [[NSMutableDictionary alloc]
                                    initWithDictionary:@{
                                                         @"type":type,
                                                         @"id":channelID,
                                                         @"pids":newChannelsID
                                                         }];
    request.paraDict = paraDic;
    [request sendRequestSuccess:success error:fail];
}
@end
