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
    UILabel *topLabel;
    int currentQuestionID;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        questionNameLabel = [UILabel new];
        topLabel = [UILabel new];
        
        [questionNameLabel setText:@"用户是否能接受路边的问答"];
        [topLabel setText:@"1/3"];
        [topLabel setBackgroundColor:rgb(74, 144, 226)];
        [topLabel setTextColor:[UIColor whiteColor]];
        [topLabel setTextAlignment:NSTextAlignmentCenter];
        
        
        [self addSubview:questionNameLabel];
        [self addSubview:topLabel];
        [self loadNextQuestion];
        [self layoutViews];
    }
    
    return self;
}

- (void)layoutViews {
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self).offset(15);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
    
    [questionNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self->topLabel.mas_bottom).offset(20);
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


@end

























