//
//  AnouncementTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "AnouncementTableViewCell.h"
#import "NSURL+PCURL.h"
#import "UILabel+VerticalAlign.h"
#import "TopLeftLabel.h"
@implementation AnouncementTableViewCell {
    UIImageView *imageView;
    TopLeftLabel *lbTitle;
    UILabel *lbTime;
}

@synthesize image = _image;
@synthesize titleStr = _titleStr;
@synthesize timeStr = _timeStr;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        imageView = [UIImageView new];
        lbTitle = [TopLeftLabel new];
        lbTime = [UILabel new];
        [self addSubview:imageView];
        [self addSubview:lbTitle];
        [self addSubview:lbTime];

        [imageView setImage:self.image];
        [lbTitle setText:self.titleStr];
        [lbTime setText:self.timeStr];
        
        lbTitle.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:18];
        lbTitle.textColor = [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1/1.0];
    
        [lbTitle setNumberOfLines:2];
        
        lbTime.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        lbTime.textColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:205/255.0 alpha:1/1.0];
        [lbTime setNumberOfLines:1];

        [self layoutViews];
        
    }
    return self;
}

-(void)layoutViews {
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->lbTitle);
        make.bottom.equalTo(self->lbTime);
        make.right.equalTo(self).offset(-15);
        make.width.mas_equalTo(125);
    }];
    
    [lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self).offset(20);
        make.right.equalTo(self->imageView.mas_left).offset(-20);
        make.height.mas_equalTo(52);
    }];
    
    [lbTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.left.equalTo(self).offset(15);
        make.bottom.equalTo(self).offset(-20);
        make.right.equalTo(self->lbTitle);
    }];
}

-(UIImage *)image {
    if (!_image) {
        return [UIImage imageNamed:@"banner"];
    } else {
        return _image;
    }
}

- (NSString *)titleStr {
    if (!_titleStr) {
        return @"两会8个热点经济问题 释放重要信号";
    } else {
        return _titleStr;
    }
}

-(NSString *)timeStr {
    if (!_timeStr) {
        return @"2018-04-07";
    } else {
        return _timeStr;
    }
}

-(void)setModel:(PCAnnouncementModel *)model {
    [imageView sd_setImageWithURL:[NSURL pc_imageURLWithString:model.img] placeholderImage:[UIImage imageNamed:@"banner"]];
    
    [lbTitle setText:model.title];

    [lbTime setText:model.published];
    
}

-(void)setImage:(UIImage *)image {
    if (image != _image) {
        _image = image;
        [imageView setImage:_image];
    }
}

- (void)setTitleStr:(NSString *)titleStr {
    if (titleStr != _titleStr) {
        _titleStr = titleStr;
        [lbTitle setText:_titleStr];
    }
}

-(void)setTimeStr:(NSString *)timeStr {
    if (timeStr != _timeStr) {
        _timeStr = timeStr;
        [lbTime setText:_timeStr];
    }
}

@end
