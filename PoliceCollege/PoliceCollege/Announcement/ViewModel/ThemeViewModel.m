//
//  ThemeViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "ThemeViewModel.h"

@implementation ThemeViewModel
- (void)downloadThemeListWithCurrentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    request.requstType = @"post";
    request.apiString = @"newsSearchByTypeAjax";
    NSMutableDictionary *paraDic = [[NSMutableDictionary alloc]
                                    initWithDictionary:@{
                                                         @"type":@1,
                                                         @"page.currentPage":currentPage
                                                         }];
    request.paraDict = paraDic;
    [request sendRequestSuccess:success error:fail];
}

- (void)downloadDetailThemeWithThemeID:(NSNumber *)themeID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    request.requstType = @"post";
    request.apiString = @"newsSearchInfo";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]       initWithDictionary:@{
                                                                                  @"type":@1                   }];
    [request sendRequestSuccess:success error:fail];
    
}
@end
