//
//  PCBookViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/5.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface PCBookViewModel : PCViewModel

#warning 获取推荐图书 该接口不稳定
-(void)getRecommendBookListAction:(NSNumber *)num success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

//跟据图书的id获取图书的介绍
- (void)getBookIntroductionAction:(NSNumber *)bookID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

//根据图书的id获取图书的章节
- (void)getBookChaptersListAction:(NSNumber *)bookID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

//根据图书的章节id获取图书的章节内容 以及上(下)一个章节的ID
- (void)getBookChapterContentAction:(NSNumber *)chapterID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

//根据当前章节id和图书id 获取当前图书的阅读进度
- (void)getBookProgressAction:(NSNumber *)bookID chapterID:(NSNumber *)chapterID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

/**
 根据图书的分类以及查找字段来查找图书

 @param sortType 找到图书之后的排序顺序， 0：published DESC，1：published，2：HIT DESC,3：HIT， 默认为0
 @param searchText 查找的字段
 @param typeID 图书的类型ID
 @param currentPage 当前页
 */
- (void)getBookListAction:(NSNumber *)sortType serchText:(NSString *)searchText typeID:(NSNumber *)typeID currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

#warning 图书下载 接口未定
@end
