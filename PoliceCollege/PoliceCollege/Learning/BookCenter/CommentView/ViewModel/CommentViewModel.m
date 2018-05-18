//
//  CommentViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "CommentViewModel.h"

@implementation CommentViewModel
- (void)downloadCommentListActionWithBookID:(NSNumber *)targetID
                                currentPage:(NSNumber *)currentPage
                                    success:(PCSuccessHandler)success
                                       fail:(PCFailedHandler)fail
{
    [self downloadCommentListActionWithTargetID:targetID
                                           type:@2
                                    currentPage:currentPage
                                        success:success
                                           fail:fail];
}

- (void)downloadCommentListActionWithVideoID:(NSNumber *)targetID
                                 currentPage:(NSNumber *)currentPage
                                     success:(PCSuccessHandler)success
                                        fail:(PCFailedHandler)fail
{
    [self downloadCommentListActionWithTargetID:targetID
                                           type:@1
                                    currentPage:currentPage
                                        success:success
                                           fail:fail];
}

- (void)downloadCommentListActionWithCourseID:(NSNumber *)targetID
                                  currentPage:(NSNumber *)currentPage
                                      success:(PCSuccessHandler)success
                                         fail:(PCFailedHandler)fail
{
    [self downloadCommentListActionWithTargetID:targetID
                                           type:@0
                                    currentPage:currentPage
                                        success:success
                                           fail:fail];
}

- (void)uploadCommentWithBookID:(NSNumber *)bookID commentContent:(NSString *)commentContent success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    [self uploadCommentWithTargetID:bookID
                               type:@2
                     commentContent:commentContent
                            success:success
                               fail:fail];
}

- (void)uploadCommentWithVideoID:(NSNumber *)videoID commentContent:(NSString *)commentContent success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    [self uploadCommentWithTargetID:videoID
                               type:@1
                     commentContent:commentContent
                            success:success
                               fail:fail];
}

- (void)uploadCommentWithCourseID:(NSNumber *)courseID commentContent:(NSString *)commentContent success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    [self uploadCommentWithTargetID:courseID
                               type:@0
                     commentContent:commentContent
                            success:success
                               fail:fail];
}

- (void)downloadCommentListActionWithTargetID:(NSNumber *)targetID
                                         type:(NSNumber *)type
                                  currentPage:(NSNumber *)currentPage
                                      success:(PCSuccessHandler)success
                                         fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"selectCommentByPage";
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]
                                     initWithDictionary:@{
                                                          @"type":type, @"page.currentPage":currentPage,
                                                          @"id":targetID,
                                                          }];
    request.paraDict = paraDict;
    [request sendRequestSuccess:success error:fail];
}

- (void)uploadCommentWithTargetID:(NSNumber *)targetID type:(NSNumber *)type commentContent:(NSString *)commentContent success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"commentAddByAjax";
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]
                                     initWithDictionary:@{
                                                          @"comment.type":type, @"comment.content":commentContent,
                                                          @"comment.cid":targetID,
                                                          }];
    request.paraDict = paraDict;
    [request sendRequestSuccess:success error:fail];
}
@end
