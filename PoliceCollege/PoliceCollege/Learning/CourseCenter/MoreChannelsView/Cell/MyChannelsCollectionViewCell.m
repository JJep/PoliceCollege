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

-(void)setChannelModel:(ChannelModel *)channelModel {
    if (_channelModel != channelModel) {
        _channelModel = channelModel;
        if (_channelModel.isMy) {
            [channelNameLabel setText:_channelModel.channelName];
            [self setBackgroundColor:rgb(245, 245, 245)];
            if ([_channelModel.channelName isEqualToString:@"关注"] || [_channelModel.channelName isEqualToString:@"推荐"]) {
                [channelNameLabel setTextColor:rgb(152, 152, 152)];
            }
        } else {
            [channelNameLabel setText:[NSString stringWithFormat:@"+%@", _channelModel.channelName]];
            [self setBackgroundColor:[UIColor whiteColor]];
        }
    }
}

@end

















