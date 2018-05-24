//
//  SearchViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface SearchViewModel : PCViewModel
- (void)afGetListWithTitle:(NSString *)title type:(NSNumber *)type currentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;
@end
