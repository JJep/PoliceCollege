//
//  OptionView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/29.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "OptionView.h"
#import "OptionButton.h"
@implementation OptionView 

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        _optionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _optionButton = [OptionButton new];
        _optionLabel = [UILabel new];
        
        
        [self addSubview:_optionButton];
        [self addSubview:_optionLabel];
        
        [_optionLabel setTextColor:rgb(72, 72, 72)];
        [_optionButton addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
        
//        _optionButton.layer.shadowColor = rgb(74, 114, 226).CGColor;
//        _optionButton.layer.shadowRadius = _optionButton.bounds.size.width - 10;
        
        
        [self layoutViews];
    }
    return self;
}

- (void)layoutViews {
    [_optionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(15);
        make.width.equalTo(self.optionButton.mas_height);
        make.width.mas_equalTo(25);
    }];
    
    [_optionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_optionButton.mas_right).offset(10);
        make.top.bottom.right.equalTo(self);
    }];
    
}

- (void)didTouchBtn:(UIButton *)button {
    [button setSelected:!button.selected];
}

@end
