//
//  OptionView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/29.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "OptionView.h"

@implementation OptionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _optionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _optionLabel = [UILabel new];
        
        [self addSubview:_optionButton];
        [self addSubview:_optionLabel];
        
        [_optionLabel setTextColor:rgb(72, 72, 72)];
        _optionButton.layer.borderWidth = 1.0f;
        _optionButton.layer.borderColor = MyLightGrayColor.CGColor;
        _optionButton.layer.cornerRadius = 15;
        _optionButton.layer.masksToBounds = true;
        
        
        [self layoutViews];
    }
    return self;
}

- (void)layoutViews {
    [_optionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self).offset(15);
        make.width.equalTo(self.optionButton.mas_height);
    }];
    
    [_optionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_optionButton.mas_right).offset(10);
        make.top.bottom.right.equalTo(self);
    }];
    
}

@end
