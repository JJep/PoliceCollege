//
//  ThemeViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface ThemeViewModel : PCViewModel
- (void)downloadThemeListWithCurrentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

- (void)downloadDetailThemeWithThemeID:(NSNumber *)themeID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
@end
