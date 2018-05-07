//
//  PCAnnouncementViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/7.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCAnnouncementViewModel.h"

@implementation PCAnnouncementViewModel
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
