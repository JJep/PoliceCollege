//
//  MyChannelsCollectionViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MyChannelsCollectionViewCell.h"
@implementation MyChannelsCollectionViewCell {
    UILabel *channelNameLabel;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:rgb(244,245,246)];
        
        channelNameLabel = [UILabel new];
        [self.contentView addSubview:channelNameLabel];
        [channelNameLabel setText:@"热门"];
        [channelNameLabel setTextAlignment:NSTextAlignmentCenter];
        [channelNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setModel:(Channel *)model {
    [channelNameLabel setText:model.name];
}

@end

















