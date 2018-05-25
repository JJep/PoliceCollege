//
//  SearchViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface SearchViewModel : PCViewModel

- (void)afGetListWithType:(NSNumber *)type title:(NSString *)title currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

- (void)afGetBookListWithTitle:(NSString *)title currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

- (void)afGetCourseListWithTitle:(NSString *)title currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

- (void)afGetVideoListWithTitle:(NSString *)title currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;
@end
