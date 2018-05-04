//
//  PCAlertControllerViewController.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/3.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCAlertControllerViewController : UIAlertController
- (instancetype)initWithMessage:(NSString *)message;
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;
- (instancetype)initWithWarningMessage:(NSString *)message;
- (instancetype)initWithWarningTitle:(NSString *)title message:(NSString *)message;
@end
