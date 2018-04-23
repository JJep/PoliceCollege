//
//  ItemModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/21.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MeTableViewModel.h"

@interface MeItem : MeTableViewModel
@property (nonatomic,copy)NSString *title;
@property (nonatomic,retain)UIImage *image;
@property (nonatomic,copy)NSString *content;
@end
