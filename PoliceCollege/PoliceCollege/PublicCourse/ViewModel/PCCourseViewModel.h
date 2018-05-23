//
//  PCCourseViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/9.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface PCCourseViewModel : PCViewModel
- (void)getFirstRecommendedCourseListAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
- (void)getMoreREcommendedCourseListAction:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
- (void)getDetailCourseAction:(NSNumber *)courseID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
//根据不同的频道获取课程
- (void)afGetCourseListWithTypeID:(NSNumber *)typeID currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;
//获取已选课程
- (void)downloadSelectedCourseWithCurrentPage :(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;
@end
