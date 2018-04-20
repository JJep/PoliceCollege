//
//  CentralIssueView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCHotIssueView.h"

@implementation PCHotIssueView {
    UIView *gradientView;
    UILabel *title;
    UIButton *more;
//    UITableView *hotIssueTableView;
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        gradientView = [UIView new];
        title = [UILabel new];
        more = [UIButton new];
        _hotIssueTableView = [UITableView new];
        
        //95,190,247
        //49,138,236
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)rgb(95, 190, 247).CGColor, (__bridge id)rgb(49, 138, 236).CGColor];
        gradientLayer.locations = @[@0, @1];
        gradientLayer.startPoint = CGPointMake(0, 1);
        gradientLayer.endPoint = CGPointMake(0, 0);
        [gradientView.layer addSublayer:gradientLayer];
        
        title.text = @"今日热点";
        title.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:13];
        title.textColor = [UIColor colorWithRed:49/255.0 green:138/255.0 blue:236/255.0 alpha:1/1.0];
        
        [more setTitle:@"更多" forState:UIControlStateNormal];
        [more.titleLabel setFont: [UIFont fontWithName:@"PingFang-SC-Regular" size:11]];
        [more setTitleColor:rgb(204, 204, 206) forState:UIControlStateNormal];

        [self addSubview:gradientView];
        [self addSubview:title];
        [self addSubview:more];
        [self addSubview:_hotIssueTableView];
        
    }
    return self;
}

-(void)layoutSubviews {
    [gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(11);
        make.width.mas_equalTo(2);
        make.height.mas_equalTo(14);
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->gradientView.mas_right).offset(10);
        make.top.equalTo(self.mas_top).offset(9);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(52);
    }];
    
    [more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-15);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(16);
        make.centerY.equalTo(self->title);
    }];
    
    [_hotIssueTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).offset(8);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
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
