//
//  ChannelCollectionViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "ChannelCollectionViewCell.h"

@implementation ChannelCollectionViewCell {
    UILabel *channelLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        channelLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [channelLabel setText:@"劳动改造"];
        [channelLabel setFont:[UIFont systemFontOfSize:16]];
        [channelLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:channelLabel];
        [channelLabel setTextAlignment:NSTextAlignmentCenter];
        [channelLabel setFont:[UIFont fontWithName:@"PingFangSC-Thin" size:15]];
    }
    return self;
}

-(void)setChannelName:(NSString *)channelName {
    if (_channelName != channelName) {
        _channelName = channelName;
        [channelLabel setText:_channelName];
    }
}

-(void)setIsSelected:(BOOL)isSelected {
    if (_isSelected != isSelected) {
        _isSelected = isSelected;
        if (_isSelected) {
            channelLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:16];
        } else {
            channelLabel.font = [UIFont fontWithName:@"PingFangSC-Thin" size:15];
        }
    }
}

@end
