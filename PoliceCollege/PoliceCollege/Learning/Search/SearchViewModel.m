//
//  SearchViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchViewModel.h"

@implementation SearchViewModel
- (void)afGetListWithTitle:(NSString *)title type:(NSNumber *)type currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    request.requstType = @"post";
    request.apiString = @"bookSearchByTypeAjax";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"type":type,
                                                                                  @"title":title,
                                                                                  @"page.currentPage":currentPage
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}
@end
