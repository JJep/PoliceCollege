//
//  UserViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface UserViewModel : PCViewModel
- (void)getUserInfoAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
@end
