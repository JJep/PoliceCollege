//
//  MePortraitButton.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MePortraitTableViewCell.h"

@implementation MePortraitTableViewCell {
    UIImageView *portraitImageView;
    UILabel *lbName;
    UILabel *lbtime;
    UIImageView *arrowImageView;
    CAGradientLayer *gradientLayer;
}

@synthesize image = _image;
@synthesize nameStr = _nameStr;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        portraitImageView = [UIImageView new];
        lbName = [UILabel new];
        lbtime = [UILabel new];
        arrowImageView = [UIImageView new];
        
        //49,138,236
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)rgb(42,194,253).CGColor, (__bridge id)rgb(41,128,226).CGColor];
        gradientLayer.locations = @[@0, @1];
        gradientLayer.startPoint = CGPointMake(0, 0.5);
        gradientLayer.endPoint = CGPointMake(1, 0.5);
        gradientLayer.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 201);
        [self.layer addSublayer:gradientLayer];

        [self addSubview:portraitImageView];
        [self addSubview:lbName];
        [self addSubview:lbtime];
        [self addSubview:arrowImageView];
        
        [portraitImageView setImage:self.image];
        portraitImageView.layer.cornerRadius = 40;
        portraitImageView.layer.masksToBounds = true;
        [lbName setText:self.nameStr];
        [lbtime setText:[NSString stringWithFormat:
                         @"累计读%.1lf小时,今日读%.0lf分钟",self.totalTime,self.todayTime]];
        
        [arrowImageView setImage:[UIImage imageNamed:@"arrow"]];
        
        lbName.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:18];
        lbName.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];

        lbtime.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        lbtime.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        
    }
    return self;
}


- (void)setImage:(UIImage *)image {
    if (_image != image) {
        _image = image;
        [portraitImageView setImage:_image];
    }
}

- (void)setNameStr:(NSString *)nameStr {
    if (nameStr != _nameStr) {
        _nameStr = nameStr;
        [lbName setText:_nameStr];
    }
}

-(void)setTotalTime:(float)totalTime {
    if (totalTime != _totalTime) {
        _totalTime = totalTime;
        [lbtime setText:[NSString stringWithFormat:
                         @"累计读%lf.1小时,今日读%lf.0分钟",self.totalTime,self.todayTime]];
    }
}

-(void)setTodayTime:(float)todayTime {
    if (todayTime != _todayTime) {
        _todayTime = todayTime;
        [lbtime setText:[NSString stringWithFormat:
                         @"累计读%lf.1小时,今日读%lf.0分钟",self.totalTime,self.todayTime]];
    }
}

-(UIImage *)image {
    if (!_image) {
        return [UIImage imageNamed:@"portrait"];
    }else {
        return _image;
    }
}

-(NSString *)nameStr {
    if (!_nameStr) {
        return @"userName";
    } else {
        return _nameStr;
    }
}

- (void)layoutSubviews {
    [portraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(80);
    }];
    
    [lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->portraitImageView.mas_right).offset(20);
        make.centerY.equalTo(self).offset(-10);
        make.right.equalTo(self).offset(-100);
        make.height.mas_equalTo(25);
    }];
    
    [lbtime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->lbName);
        make.top.equalTo(self->lbName.mas_bottom).offset(6);
        make.right.equalTo(self->arrowImageView.mas_left).offset(-5);
        make.height.mas_equalTo(20);
    }];
    
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.width.height.mas_equalTo(18);
        make.centerY.equalTo(self);
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
