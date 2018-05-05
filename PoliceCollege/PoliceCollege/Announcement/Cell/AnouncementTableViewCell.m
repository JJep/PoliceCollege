//
//  AnouncementTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "AnouncementTableViewCell.h"

@implementation AnouncementTableViewCell {
    UIImageView *imageView;
    UILabel *lbTitle;
    UILabel *lbTime;
    UILabel *lbCommentsNum;
    UIImageView *commentImageView;
}

@synthesize image = _image;
@synthesize titleStr = _titleStr;
@synthesize timeStr = _timeStr;
@synthesize commentsNum = _commentsNum;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [UIImageView new];
        lbTitle = [UILabel new];
        lbTime = [UILabel new];
        lbCommentsNum = [UILabel new];
        commentImageView = [UIImageView new];
        [self addSubview:imageView];
        [self addSubview:lbTitle];
        [self addSubview:lbTime];
        [self addSubview:lbCommentsNum];
        [self addSubview:commentImageView];
        [commentImageView setImage:[UIImage imageNamed:@"comment"]];
        [imageView setImage:self.image];
        [lbTitle setText:self.titleStr];
        [lbTime setText:self.timeStr];
        [lbCommentsNum setText:[NSString stringWithFormat:@"%d",self.commentsNum]];
        
        lbTitle.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:18];
        lbTitle.textColor = [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1/1.0];
        [lbTitle setNumberOfLines:0];
        
        lbTime.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        lbTime.textColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:205/255.0 alpha:1/1.0];
        
        lbCommentsNum.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        lbCommentsNum.textColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:205/255.0 alpha:1/1.0];

        [self layoutViews];
        
    }
    return self;
}

-(void)layoutViews {
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20);
        make.bottom.equalTo(self).offset(-20);
        make.right.equalTo(self).offset(-15);
        make.width.mas_equalTo(125);
    }];
    
    [lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self).offset(20);
        make.right.equalTo(self->imageView.mas_left).offset(-20);
        make.bottom.equalTo(self->lbTime.mas_top).offset(-20);
    }];
    
    [lbTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.bottom.equalTo(self).offset(-20);
        make.height.mas_equalTo(18);
        make.right.equalTo(self->commentImageView.mas_left).offset(-20);
    }];
    
    [commentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo([UIImage imageNamed:@"comment"].size);
        make.centerY.equalTo(self->lbTime);
        make.right.equalTo(self->lbCommentsNum.mas_left).offset(-13.7);
    }];
    
    [lbCommentsNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->imageView.mas_left).offset(-10);
        make.centerY.equalTo(self->lbTime);
        make.height.mas_equalTo(18);
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

- (int)commentsNum {
    if (!_commentsNum) {
        return 20;
    } else {
        return _commentsNum;
    }
}

-(void)setModel:(PCAnnouncementModel *)model {
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"banner"]];
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

-(void)setCommentsNum:(int)commentsNum {
    if (commentsNum != _commentsNum) {
        _commentsNum = commentsNum;
        [lbCommentsNum setText:[NSString stringWithFormat:@"%d",_commentsNum]];
    }
}

@end
