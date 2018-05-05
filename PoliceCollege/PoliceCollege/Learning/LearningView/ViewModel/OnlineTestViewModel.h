//
//  OnlineTestViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/5.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface OnlineTestViewModel : PCViewModel
- (void)getTestPapersAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
@end
