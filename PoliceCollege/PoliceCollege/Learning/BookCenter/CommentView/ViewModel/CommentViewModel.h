//
//  CommentViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface CommentViewModel : PCViewModel

//根据type，targetID及currentpage获取target的评论
- (void)downloadCommentListActionWithTargetID:(NSNumber *)targetID
                                         type:(NSNumber *)type
                                  currentPage:(NSNumber *)currentPage
                                      success:(PCSuccessHandler)success
                                         fail:(PCFailedHandler)fail;

//根据bookID及currentpage获取的评论
- (void)downloadCommentListActionWithBookID:(NSNumber *)targetID
                                  currentPage:(NSNumber *)currentPage
                                      success:(PCSuccessHandler)success
                                         fail:(PCFailedHandler)fail ;

//根据videoID及currentpage获取的评论
- (void)downloadCommentListActionWithVideoID:(NSNumber *)targetID
                                  currentPage:(NSNumber *)currentPage
                                      success:(PCSuccessHandler)success
                                         fail:(PCFailedHandler)fail ;

//根据courseID及currentpage获取的评论
- (void)downloadCommentListActionWithCourseID:(NSNumber *)targetID
                                  currentPage:(NSNumber *)currentPage
                                      success:(PCSuccessHandler)success
                                         fail:(PCFailedHandler)fail ;


//根据targetID，type及commentContent添加评论
- (void)uploadCommentWithTargetID:(NSNumber *)targetID type:(NSNumber *)type commentContent:(NSString *)commentContent success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

- (void)uploadCommentWithBookID:(NSNumber *)bookID commentContent:(NSString *)commentContent success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

- (void)uploadCommentWithVideoID:(NSNumber *)videoID commentContent:(NSString *)commentContent success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

- (void)uploadCommentWithCourseID:(NSNumber *)courseID commentContent:(NSString *)commentContent success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

@end
