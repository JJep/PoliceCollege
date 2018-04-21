//
//  MeItemTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeTableViewCell.h"
#import "MeItem.h"
@interface MeItemTableViewCell : MeTableViewCell;
@property (nonatomic,retain)UIImage *image;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *content;
@end
