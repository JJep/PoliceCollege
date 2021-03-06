//
//  MyChannelsCollectionViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Channel.h"

@interface MyChannelsCollectionViewCell : UICollectionViewCell
@property (nonatomic,retain)UIButton *clearButton;
- (void)setModel:(Channel *)model;
- (void)setEditing:(BOOL)isEditing;
@end
