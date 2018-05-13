//
//  ChannelCollectionViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Channel.h"
@interface ChannelCollectionViewCell : UICollectionViewCell
@property (nonatomic,copy)NSString *channelName;
@property (nonatomic,assign)BOOL isSelected;

- (void)setModel:(Channel *)model;
@end
