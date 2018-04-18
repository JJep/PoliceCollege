//
//  UITextfieldView.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextfieldView : UIView
@property (nonatomic,retain)UIImage *image;
@property (nonatomic,copy)NSString *placeHolderText;
@property (nonatomic)BOOL secure;
@property (nonatomic,copy)NSString *text;
@end
