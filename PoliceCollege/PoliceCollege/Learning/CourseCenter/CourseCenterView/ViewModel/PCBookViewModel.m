//
//  PCBookViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/5.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCBookViewModel.h"

@implementation PCBookViewModel

- (void)getRecommendBookListAction:(NSNumber *)num success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"bookSearchByRecommended";
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]
                                     initWithDictionary:@{
                                                          @"page.currentPage":num
                                                          }];
    request.paraDict = paraDict;
    [request sendRequestSuccess:success error:fail];
}

- (void)getBookIntroductionAction:(NSNumber *)bookID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"bookSearchInfo";
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]
                                     initWithDictionary:@{
                                                          @"id":bookID
                                                          }];
    request.paraDict = paraDict;
    [request sendRequestSuccess:success error:fail];
}

- (void)getBookChaptersListAction:(NSNumber *)bookID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"sectionList";
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]
                                     initWithDictionary:@{
                                                          @"id":bookID
                                                          }];
    request.paraDict = paraDict;
    [request sendRequestSuccess:success error:fail];
}

- (void)getBookChapterContentAction:(NSNumber *)chapterID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"bookSearchContent";
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]
                                     initWithDictionary:@{
                                                          @"id":chapterID
                                                          }];
    request.paraDict = paraDict;
    [request sendRequestSuccess:success error:fail];
}

- (void)getBookProgressAction:(NSNumber *)bookID chapterID:(NSNumber *)chapterID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"bookLearnrecordByAjax";
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]
                                     initWithDictionary:@{
                                                          @"section.bookid":bookID,
                                                          @"section.id":chapterID
                                                          }];
    request.paraDict = paraDict;
    [request sendRequestSuccess:success error:fail];
}

- (void)getBookListAction:(NSNumber *)sortType serchText:(NSString *)searchText typeID:(NSNumber *)typeID currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"bookSearchByTypeAjax";
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]
                                     initWithDictionary:@{
                                                          @"sortType":@0,
                                                          @"title":searchText,
                                                          @"type":typeID,
                                                          @"page.currentPage":currentPage
                                                          }];
    request.paraDict = paraDict;
    [request sendRequestSuccess:success error:fail];
}

@end
