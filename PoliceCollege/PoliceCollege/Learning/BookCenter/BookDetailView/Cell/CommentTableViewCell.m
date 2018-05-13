//
//  CommentTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell {
    UIImageView *portraitImageView;
    UILabel *userNameLabel;
    UILabel *contentLabel;
    UILabel *timeLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        portraitImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"portrait"]];
        userNameLabel = [UILabel new];
        contentLabel = [UILabel new];
        timeLabel = [UILabel new];
        
        userNameLabel.text = @"厉害了我的国";
        userNameLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        userNameLabel.textColor = [UIColor colorWithRed:11/255.0 green:166/255.0 blue:254/255.0 alpha:1/1.0];

        contentLabel.text = @"这个消息很精彩";
        [contentLabel setNumberOfLines:0];
        contentLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        contentLabel.textColor = [UIColor colorWithRed:19/255.0 green:18/255.0 blue:19/255.0 alpha:1/1.0];

        timeLabel.text = @"2小时前";
        timeLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9];
        timeLabel.textColor = [UIColor colorWithRed:172/255.0 green:172/255.0 blue:172/255.0 alpha:1/1.0];

        [self addSubview:portraitImageView];
        [self addSubview:userNameLabel];
        [self addSubview:contentLabel];
        [self addSubview:timeLabel];
        
        [portraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(15);
            make.width.mas_equalTo(30);
            make.height.equalTo(self->portraitImageView.mas_width);
        }];
        
        [userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->portraitImageView.mas_right).offset(15);
            make.top.equalTo(self).offset(11);
            make.right.equalTo(self).offset(-20);
        }];
        
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->userNameLabel.mas_bottom);
            make.left.equalTo(self->portraitImageView.mas_right).offset(15);
            make.right.equalTo(self).offset(-15);
        }];
        
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->contentLabel);
            make.top.equalTo(self->contentLabel.mas_bottom).offset(3);
            make.right.equalTo(self).offset(-15);
            make.bottom.equalTo(self).offset(-10);
        }];
        
    }
    return self;
}



























@end
