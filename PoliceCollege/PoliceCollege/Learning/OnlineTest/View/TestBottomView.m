//
//  TestBottomView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/29.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "TestBottomView.h"

@implementation TestBottomView {
    UIView *bottomView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setBackgroundColor:MyWhiteBackgroundColor];
        
        bottomView = [UIView new];
        _listButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_listButton setTitleColor:rgb(74, 144, 226) forState:UIControlStateNormal];
        [_listButton.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_listButton setTitle:@"目录" forState:UIControlStateNormal];
        _listButton.layer.borderWidth = 1.0f;
        _listButton.layer.borderColor = rgb(74, 144, 226).CGColor;
        
        [_nextButton setTitle:@"下一题" forState:UIControlStateNormal];
        [_nextButton setBackgroundColor:rgb(74, 144, 226)];
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self addSubview:bottomView];
        [self addSubview:_listButton];
        [self addSubview:_nextButton];
        
        [self layoutViews];
    }
    return self;
}

- (void)layoutViews {
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(50);
    }];
    
    [_listButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->bottomView).offset(15);
        make.top.equalTo(self->bottomView).offset(8);
        make.bottom.equalTo(self->bottomView).offset(-8);
        make.width.mas_equalTo(75);
    }];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self->bottomView);
        make.width.mas_equalTo(110);
    }];
}





@end
