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
@end
