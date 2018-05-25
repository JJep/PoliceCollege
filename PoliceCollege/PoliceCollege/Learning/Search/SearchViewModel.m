//
//  SearchViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchViewModel.h"

@implementation SearchViewModel

- (void)afGetListWithType:(NSNumber *)type title:(NSString *)title currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
     //3.课件类型 //4.图书类型//5.视频类型
    switch ([type integerValue]) {
        case 3:
            [self afGetCourseListWithTitle:title currentPage:currentPage success:success fail:fail];
            break;
        case 4:
            [self afGetBookListWithTitle:title currentPage:currentPage success:success fail:fail];
            break;
        case 5:
            [self afGetVideoListWithTitle:title currentPage:currentPage success:success fail:fail];
            break;
        default:
            break;
    }
}

- (void)afGetBookListWithTitle:(NSString *)title currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    request.requstType = @"post";
    request.apiString = @"bookSearchByTypeAjax";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"title":title,
                                                                                  @"page.currentPage":currentPage
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

- (void)afGetCourseListWithTitle:(NSString *)title currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    request.requstType = @"post";
    request.apiString = @"courseSearchByTypeAjax";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                                          @"title":title,
                                                                                  @"page.currentPage":currentPage
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

- (void)afGetVideoListWithTitle:(NSString *)title currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail {
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    request.requstType = @"post";
    request.apiString = @"videoSearchByTypeAjax";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"title":title,
                                                                                  @"page.currentPage":currentPage
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}
@end
