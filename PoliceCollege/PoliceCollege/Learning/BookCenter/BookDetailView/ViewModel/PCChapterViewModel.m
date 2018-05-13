//
//  PCChapterViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/9.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCChapterViewModel.h"

@implementation PCChapterViewModel
- (void)getChapterListWithBookIDAction:(NSNumber *)bookID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"sectionList";
    NSMutableDictionary *paraDic = [[NSMutableDictionary alloc]
                                    initWithDictionary:@{
                                                         @"id":bookID
                                                         }];
    request.paraDict = paraDic;
    [request sendRequestSuccess:success error:fail];
}
@end
