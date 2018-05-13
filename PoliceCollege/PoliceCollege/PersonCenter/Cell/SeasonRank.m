//
//  SeasonRank.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/27.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SeasonRank.h"

@implementation SeasonRank {
    UILabel *rankTitleLabel;
    UILabel *creditTitleLabel;
    UILabel *compulsoryTitleLabel;
    UILabel *commentTitleLabel;
    UIImageView *backImage;
    UIView *view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        rankTitleLabel = [UILabel new];
        _rankLabel = [UILabel new];
        creditTitleLabel = [UILabel new];
        compulsoryTitleLabel = [UILabel new];
        commentTitleLabel = [UILabel new];
        _creditLabel = [UILabel new];
        _compulsoryLabel = [UILabel new];
        _commentLabel = [UILabel new];
        backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"personBackImage"]];
        view = [UIView new];
        
        [self addSubview:backImage];
        [self addSubview:view];
        [self addSubview:rankTitleLabel];
        [self addSubview:_rankLabel];
        [self addSubview:creditTitleLabel];
        [self addSubview:_creditLabel];
        [self addSubview:compulsoryTitleLabel];
        [self addSubview:_compulsoryLabel];
        [self addSubview:commentTitleLabel];
        [self addSubview:_commentLabel];

        
        rankTitleLabel.text = @"本季度总排名";
        rankTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:13];
        rankTitleLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];

        _rankLabel.text = @"300";
        _rankLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:40];
        _rankLabel.textColor = [UIColor colorWithRed:100/255.0 green:255/255.0 blue:0/255.0 alpha:1/1.0];
        
        _creditLabel.text = @"300";
        _creditLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        _creditLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        [_creditLabel setTextAlignment:NSTextAlignmentCenter];
        
        _commentLabel.text = @"300";
        _commentLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        _commentLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        [_commentLabel setTextAlignment:NSTextAlignmentCenter];
        
        _compulsoryLabel.text = @"300";
        _compulsoryLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        _compulsoryLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        [_compulsoryLabel setTextAlignment:NSTextAlignmentCenter];
        
        creditTitleLabel.text = @"总学分";
        creditTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
        creditTitleLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        [creditTitleLabel setTextAlignment:NSTextAlignmentCenter];
        
        commentTitleLabel.text = @"评论条数";
        commentTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
        commentTitleLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        [commentTitleLabel setTextAlignment:NSTextAlignmentCenter];
        
        compulsoryTitleLabel.text = @"必修学分";
        compulsoryTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
        compulsoryTitleLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        [compulsoryTitleLabel setTextAlignment:NSTextAlignmentCenter];
        
        [view setBackgroundColor:[UIColor whiteColor]];
        
        [self layoutView];
        

    }
    return self;
}

- (void)layoutView {
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    
    [rankTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(26);
        make.top.equalTo(self).offset(21);
        make.width.mas_equalTo(80);
//        make.height.mas_equalTo(20);
    }];
    
    [_rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->rankTitleLabel.mas_bottom).offset(4);
        make.left.equalTo(self).offset(28);
        make.right.equalTo(self).offset(-28);
//        make.height.mas_equalTo(56);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(28);
        make.right.equalTo(self).offset(-28);
        make.top.equalTo(self->_rankLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(1);
    }];
    
    [_creditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(25);
        make.top.equalTo(self->view.mas_bottom).offset(9);
        make.right.equalTo(self->_compulsoryLabel.mas_left).offset(-50);
        make.width.equalTo(self->_compulsoryLabel);
//        make.height.mas_equalTo(30);
    }];
    
    [_compulsoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_commentLabel.mas_left).offset(-50);
        make.height.top.equalTo(self->_creditLabel);
        make.width.equalTo(self->_commentLabel);
    }];
    
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-25);
        make.height.top.equalTo(self->_compulsoryLabel);
    }];
    
    [creditTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_creditLabel.mas_bottom);
        make.left.right.height.equalTo(self->_creditLabel);
        make.bottom.equalTo(self).offset(-16);
    }];
    
    [compulsoryTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_compulsoryLabel.mas_bottom);
        make.left.right.height.equalTo(self->_compulsoryLabel);
        make.bottom.equalTo(self).offset(-16);
    }];
    
    [commentTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_commentLabel.mas_bottom);
        make.left.right.height.equalTo(self->_commentLabel);
        make.bottom.equalTo(self).offset(-16);
    }];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
