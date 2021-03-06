//
//  PCRegisterModelView.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"
@interface PCLoginViewModel : PCViewModel

-(void)loginAction:(NSString *)userName password:(NSString *)password success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

@end
