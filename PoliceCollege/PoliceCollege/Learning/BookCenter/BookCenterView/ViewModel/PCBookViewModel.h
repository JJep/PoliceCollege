//
//  PCBookViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/5.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface PCBookViewModel : PCViewModel

//根据当前页码获取推荐图书
-(void)getRecommendBookListAction:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

//跟据图书的id获取图书的介绍
- (void)getBookIntroductionAction:(NSNumber *)bookID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

//根据图书的id获取图书的章节
- (void)getBookChaptersListAction:(NSNumber *)bookID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

//根据图书的章节id获取图书的章节内容 以及上(下)一个章节的ID
- (void)getBookChapterContentAction:(NSNumber *)chapterID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

- (void)getBookCommentListActionWithBookID:(NSNumber *)bookID currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

//根据当前章节id和图书id 获取当前图书的阅读进度
- (void)getBookProgressAction:(NSNumber *)bookID chapterID:(NSNumber *)chapterID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

/**
 根据图书的分类以及查找字段来查找图书

 @param searchText 查找的字段
 @param typeID 图书的类型ID
 @param currentPage 当前页
 */
- (void)getBookListActionWithSearchText:(NSString *)searchText typeID:(NSNumber *)typeID currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

/**
 根据图书的分类来查找图书
 
 @param typeID 图书的类型ID
 @param currentPage 当前页
 */
- (void)getBookListActionWithTypeID:(NSNumber *)typeID currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;


- (void)downloadBookWithBookID:(NSNumber *)bookID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

@end
