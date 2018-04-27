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
    UILabel *rankLabel;
    UILabel *creditTitleLabel;
    UILabel *compulsoryTitleLabel;
    UILabel *commentTitleLabel;
    UILabel *creditLabel;
    UILabel *compulsoryLabel;
    UILabel *commentLabel;
    UIImageView *backImage;
    UIView *view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        rankTitleLabel = [UILabel new];
        rankLabel = [UILabel new];
        creditTitleLabel = [UILabel new];
        compulsoryTitleLabel = [UILabel new];
        commentTitleLabel = [UILabel new];
        creditLabel = [UILabel new];
        compulsoryLabel = [UILabel new];
        commentLabel = [UILabel new];
        backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"personBackImage"]];
        view = [UIView new];
        
        [self addSubview:backImage];
        [self addSubview:view];
        [self addSubview:rankTitleLabel];
        [self addSubview:rankLabel];
        [self addSubview:creditTitleLabel];
        [self addSubview:creditLabel];
        [self addSubview:compulsoryTitleLabel];
        [self addSubview:compulsoryLabel];
        [self addSubview:commentTitleLabel];
        [self addSubview:commentLabel];

        
        rankTitleLabel.text = @"本季度总排名";
        rankTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:13];
        rankTitleLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];

        rankLabel.text = @"300";
        rankLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:40];
        rankLabel.textColor = [UIColor colorWithRed:100/255.0 green:255/255.0 blue:0/255.0 alpha:1/1.0];
        
        creditLabel.text = @"300";
        creditLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        creditLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        [creditLabel setTextAlignment:NSTextAlignmentCenter];
        
        commentLabel.text = @"300";
        commentLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        commentLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        [commentLabel setTextAlignment:NSTextAlignmentCenter];
        
        compulsoryLabel.text = @"300";
        compulsoryLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        compulsoryLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        [compulsoryLabel setTextAlignment:NSTextAlignmentCenter];
        
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
    
    [rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->rankTitleLabel.mas_bottom).offset(4);
        make.left.equalTo(self).offset(28);
        make.right.equalTo(self).offset(-28);
//        make.height.mas_equalTo(56);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(28);
        make.right.equalTo(self).offset(-28);
        make.top.equalTo(self->rankLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(3);
    }];
    
    [creditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(25);
        make.top.equalTo(self->view.mas_bottom).offset(9);
        make.right.equalTo(self->compulsoryLabel.mas_left).offset(-50);
        make.width.equalTo(self->compulsoryLabel);
//        make.height.mas_equalTo(30);
    }];
    
    [compulsoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->commentLabel.mas_left).offset(-50);
        make.height.top.equalTo(self->creditLabel);
        make.width.equalTo(self->commentLabel);
    }];
    
    [commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-25);
        make.height.top.equalTo(self->compulsoryLabel);
    }];
    
    [creditTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->creditLabel.mas_bottom);
        make.left.right.height.equalTo(self->creditLabel);
        make.bottom.equalTo(self).offset(-16);
    }];
    
    [compulsoryTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->compulsoryLabel.mas_bottom);
        make.left.right.height.equalTo(self->compulsoryLabel);
        make.bottom.equalTo(self).offset(-16);
    }];
    
    [commentTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->commentLabel.mas_bottom);
        make.left.right.height.equalTo(self->commentLabel);
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
