//
//  PCBaseViewController.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCViewModel.h"

@interface PCBaseViewController : UIViewController

@property(nonatomic,strong) PCViewModel *viewModel;

//-(instancetype)initWithViewModel:(PCViewModel *)viewModel;
//
//- (void)presentLoginViewControllerWithSucceedHandler:(nullable void(^)(void))succeedHandler;
//
//- (void)topToBottomGradientstartColor:(nullable CGColorRef)startColor endColor:(nullable CGColorRef)endColor;

@end
