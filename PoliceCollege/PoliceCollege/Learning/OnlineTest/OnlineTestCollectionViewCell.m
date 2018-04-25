//
//  OnlineTestCollectionViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "OnlineTestCollectionViewCell.h"

@implementation OnlineTestCollectionViewCell {
    UIImageView *imageView;
    UILabel *titleLabel;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        imageView = [UIImageView new];
        titleLabel = [UILabel new];
        [self addSubview:imageView];
        [self addSubview:titleLabel];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.bottom.equalTo(self->titleLabel.mas_top).offset(-8);
        }];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(16);
        }];
        
        [imageView setImage:[UIImage imageNamed:@"banner"]];
        [titleLabel setText:@"HTML入门测试"];
    }
    return self;
}

@end
