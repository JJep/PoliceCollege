//
//  PublicVideoTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PublicVideoTableViewCell.h"

@implementation PublicVideoTableViewCell {
    UIImageView *imageView;
    UILabel *titleLabel;
    UILabel *subTitleLabel;
    UILabel *timeLabel;
    UILabel *commentsNumLabel;
    UIImageView *commentImageView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [UIImageView new];
        titleLabel = [UILabel new];
        subTitleLabel  = [UILabel new];
        timeLabel = [UILabel new];
        commentsNumLabel = [UILabel new];
        commentImageView = [UIImageView new];
        
        [self addSubview:imageView];
        [self addSubview:titleLabel];
        [self addSubview:subTitleLabel];
        [self addSubview:timeLabel];
        [self addSubview:commentsNumLabel];
        [self addSubview:commentImageView];
        
        titleLabel.text = @"阳春三月，陕西汉中的数万亩油菜花竞相绽放与往年不同";
        titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:19];
        titleLabel.textColor = [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1/1.0];
        [titleLabel setNumberOfLines:0];
        
        subTitleLabel.text = @"与往年不同，随着去年西成高铁的开通，今年一列列高铁穿越在油彩画";
        subTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
        subTitleLabel.textColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:205/255.0 alpha:1/1.0];
        
        [imageView setImage:[UIImage imageNamed:@"banner"]];
        
        timeLabel.text = @"03 月 26 日更新";
        timeLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
        timeLabel.textColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:205/255.0 alpha:1/1.0];
        
        commentsNumLabel.text = @"20";
        commentsNumLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
        commentsNumLabel.textColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:205/255.0 alpha:1/1.0];
        
        [commentImageView setImage:[UIImage imageNamed:@"comment"]];
    }
    return  self;
}

- (void)layoutSubviews {
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self).offset(22);
        make.height.mas_equalTo(160);
    }];
    
    [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self->imageView.mas_bottom).offset(12);
        make.height.mas_equalTo(14);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self->subTitleLabel.mas_bottom).offset(2);
        make.height.mas_equalTo(52);
    }];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self->titleLabel.mas_bottom).offset(6);
        make.bottom.equalTo(self).offset(-18);
        make.width.mas_equalTo(90);
    }];
    
    [commentsNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-24);
        make.width.mas_equalTo(14);
        make.height.mas_equalTo(14);
        make.bottom.equalTo(self).offset(-17);
    }];
    
    [commentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->commentsNumLabel.mas_left).offset(-7);
        make.width.height.mas_equalTo(10);
        make.bottom.equalTo(self).offset(-17);
    }];
    
}

- (void)setModel:(Video *)model {
    
    [imageView sd_setImageWithURL:[NSURL pc_imageURLWithString:model.img]];
    [titleLabel setText:model.title];
//    [subTitleLabel setText:model.content];
    [timeLabel setText:model.published];
    [commentsNumLabel setText:[NSString stringWithFormat:@"%lu",(unsigned long)model.commentNum ]];
    
}

@end
