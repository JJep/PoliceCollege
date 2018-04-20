//
//  HotIssueTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "HotIssueTableViewCell.h"

@implementation HotIssueTableViewCell {
    UIImageView *imageView;
    UILabel *lbTitle;
    UILabel *lbTime;
}

@synthesize image = _image;
@synthesize titleStr = _titleStr;
@synthesize timeStr = _timeStr;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [UIImageView new];
        lbTitle = [UILabel new];
        lbTime = [UILabel new];
        
        [self addSubview:imageView];
        [self addSubview:lbTitle];
        [self addSubview:lbTime];
        
        lbTitle.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        lbTime.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        lbTime.textColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:206/255.0 alpha:1/1.0];
        lbTitle.numberOfLines = 0;
//        [lbTitle setNumberOfLines:2];
        lbTime.textAlignment = NSTextAlignmentRight;
        
        [imageView setImage:self.image];
        [lbTitle setText:self.titleStr];
        [lbTime setText:self.timeStr];
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    if (_image != image) {
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
    if (_timeStr != timeStr) {
        _timeStr = timeStr;
        [lbTime setText:_timeStr];
    }
}

-(UIImage *)image {
    if (!_image) {
        return [UIImage imageNamed:@"banner"];
    }else {
        return _image;
    }
}

-(NSString *)titleStr {
    if (!_titleStr) {
        return @"人工智能地平线如何用芯片赋能在安防";
    } else {
        return _titleStr;
    }
}

-(NSString *)timeStr {
    if (!_timeStr) {
        return @"2018-04-05 10:38";
    } else {
        return _timeStr;
    }
}

-(void)layoutSubviews {
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self).offset(15);
        make.bottom.equalTo(self).offset(-15);
        make.width.mas_equalTo(95);
    }];
    
    [lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->imageView.mas_right).offset(15);
        make.top.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-15);
//        make.height.mas_equalTo(32);
        make.bottom.equalTo(self->lbTime.mas_top).offset(-12);
    }];
    
    [lbTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.height.mas_equalTo(16);
        make.left.equalTo(self->lbTitle);
        make.bottom.equalTo(self).offset(-10);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
