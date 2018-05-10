//
//  DetailVideoTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "DetailVideoTableViewCell.h"

@implementation DetailVideoTableViewCell  {
    UIImageView *imageView;
    UILabel *titleLabel;
    UILabel *publishTimeLabel;
    UILabel *contentLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        imageView = [UIImageView new];
        titleLabel = [UILabel new];
        publishTimeLabel = [UILabel new];
        contentLabel = [UILabel new];
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [imageView setImage:[UIImage imageNamed:@"bassJackers"]];
        
        titleLabel.text = @"歼20战机的产量为什么那么少？这里告诉你答案";
        titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:20];
        titleLabel.textColor = [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1/1.0];
        titleLabel.numberOfLines = 0;
        
        publishTimeLabel.text = @"发布时间：2018-04-07";
        publishTimeLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        publishTimeLabel.textColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:205/255.0 alpha:1/1.0];
        
        contentLabel.text = @"      歼-20是中国自主研发的一款五代重型双发隐身战斗机，歼-20的服役不止是简单的宣示着中国成为世界上第二个服役五代战机的国家，这背后的战略价值和意义恐怕只有美国和俄罗斯内心最清楚！\n通俗来讲，五代战机就是各种高科技集于一身空优或多用途战斗机，不仅具有高机动性、高隐身性，还装配了极其先进的航电系统、高度集成的计算机网络和先进的机载雷达系统";
        contentLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        contentLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1/1.0];
        contentLabel.numberOfLines = 0;
        
        [_playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:imageView];
        [self.contentView addSubview:titleLabel];
        [self.contentView addSubview:publishTimeLabel];
        [self.contentView addSubview:contentLabel];
        [self.contentView addSubview:_playButton];
        
        [self layoutViews];
    }
    return self;
}

- (void)setModel:(DetailVideo *)model {
    [imageView sd_setImageWithURL:[NSURL pc_imageURLWithString:model.img]];
    [titleLabel setText:model.title];
    [publishTimeLabel setText:model.published];
    [contentLabel setText:model.content];
    
    [self updateUI];
}

- (void)updateUI {
    [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.height.mas_equalTo(200);
    }];
    
    [titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).offset(13);
        make.left.equalTo(self.contentView).offset(30);
        make.right.equalTo(self.contentView).offset(-30);
    }];
    
    [publishTimeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self->titleLabel.mas_bottom).offset(12);
    }];
    
    [contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->publishTimeLabel.mas_bottom).offset(30);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        make.bottom.equalTo(self.contentView);
    }];
    
    [_playButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self->imageView);
        make.width.height.mas_equalTo(45);
    }];
}

- (void)layoutViews {
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.height.mas_equalTo(200);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).offset(13);
        make.left.equalTo(self.contentView).offset(30);
        make.right.equalTo(self.contentView).offset(-30);
    }];
    
    [publishTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self->titleLabel.mas_bottom).offset(12);
    }];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->publishTimeLabel.mas_bottom).offset(30);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        make.bottom.equalTo(self.contentView);
    }];
    
    [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self->imageView);
        make.width.height.mas_equalTo(45);
    }];
}


@end
