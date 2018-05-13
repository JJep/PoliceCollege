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
        
        _clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clearButton setImage:[UIImage imageNamed:@"clear"] forState:UIControlStateNormal];
        [_clearButton setHidden:true];
        [self.contentView addSubview:_clearButton];
        
        [_clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self->channelNameLabel).offset(10);
            make.top.equalTo(self->channelNameLabel).offset(-10);
            make.width.height.mas_equalTo(20);
        }];

    }
    return self;
}

- (void)setModel:(Channel *)model {
    [channelNameLabel setText:model.name];
}

- (void)setEditing:(BOOL)isEditing {
    [_clearButton setHidden:!isEditing];
}

@end

















