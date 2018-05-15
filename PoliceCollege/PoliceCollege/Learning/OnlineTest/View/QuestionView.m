//
//  QuestionView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/29.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "QuestionView.h"
#import "OptionView.h"
@implementation QuestionView {
    UILabel *questionNameLabel;
    int currentQuestionID;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        questionNameLabel = [UILabel new];
        _topLabel = [UILabel new];
        
        [questionNameLabel setText:@"用户是否能接受路边的问答"];
        [questionNameLabel setNumberOfLines:0];
        [_topLabel setText:@"1/3"];
        [_topLabel setBackgroundColor:rgb(74, 144, 226)];
        [_topLabel setTextColor:[UIColor whiteColor]];
        [_topLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self addSubview:questionNameLabel];
        [self addSubview:_topLabel];
        [self loadNextQuestion];
        [self layoutViews];
    }
    
    return self;
}

- (void)layoutViews {
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self).offset(15);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(30);
    }];
    
    [questionNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self->_topLabel.mas_bottom).offset(20);
        make.right.equalTo(self);
    }];
    
}
- (void)loadNextQuestion {
    if (!_questionContentArray) {
        OptionView *view1 = [OptionView new];
        [self addSubview:view1];
        OptionView *view2 = [OptionView new];
        [self addSubview:view2];
        
        [view1.optionLabel setText:@"A:能接收"];
        [view2.optionLabel setText:@"B:不能接收"];
        
        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self->questionNameLabel.mas_bottom).offset(15);
            make.height.mas_equalTo(20);
        }];
        
        [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(view1.mas_bottom).offset(15);
            make.height.mas_equalTo(20);
        }];
        
    }
}

- (void)setModel:(Question *)model {
    [questionNameLabel setText:model.stem];
    
    CGFloat optionViewHeight = 30;
    NSArray *optionArray = [NSArray arrayWithArray:[model.options componentsSeparatedByString:@" "]];
    
    for (UIView *subview in self.subviews) {
        if ([[subview class] isEqual:[OptionView class]]) {
            [subview removeFromSuperview];
        }
    }
    
    
    
    for (int i = 0; i < optionArray.count; i++) {
        OptionView *optionView = [OptionView new];
        [self addSubview:optionView];
        [optionView.optionLabel setText:optionArray[i]];
        [optionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self->questionNameLabel.mas_bottom).offset((15 + optionViewHeight) * i + 15);
            make.height.mas_equalTo(30);
        }];
    }
}


@end

























