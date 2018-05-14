//
//  PersonalInfoTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SeasonTableViewCell.h"
#import "SeasonSubview.h"
@implementation SeasonTableViewCell {
    UILabel *titleLabel;
    UILabel *contentLabel;
    UIImageView *moreImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
   
        titleLabel = [UILabel new];
        contentLabel = [UILabel new];
        moreImageView = [UIImageView new];
        _seasonSubview = [SeasonSubview new];
        
        
        [self addSubview:titleLabel];
        [self addSubview:contentLabel];
        [self addSubview:moreImageView];
        [self addSubview:_seasonSubview];

        [titleLabel setText:@"title"];
        [contentLabel setText:@"content"];
        [moreImageView setImage:[UIImage imageNamed:@"arrow"]];
        
        titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:15];
        titleLabel.textColor = [UIColor colorWithRed:53/255.0 green:136/255.0 blue:229/255.0 alpha:1/1.0];
        
        contentLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:15];
        contentLabel.textColor = [UIColor colorWithRed:53/255.0 green:136/255.0 blue:229/255.0 alpha:1/1.0];
        [contentLabel setTextAlignment:NSTextAlignmentRight];
        
        [self layoutViews];

    }
    return self;
}

- (void)setModelWithSeason:(NSInteger)season model:(SeasonCredit *)model {
    [titleLabel setText:[NSString stringWithFormat:@"第%lu季度",season+1]];
    NSString *quarterName = [NSString stringWithFormat:@"quarter%lu",season+1];
    [contentLabel setText:[NSString stringWithFormat:@"%@", [[model valueForKey:quarterName] valueForKey:@"sum"]]];
    [_seasonSubview.commentCreditLabel setText:[NSString stringWithFormat:@"%@",[[model valueForKey:quarterName] valueForKey:@"comment"]]];
    [_seasonSubview.compusoryCreditLabel setText:[NSString stringWithFormat:@"%@",[[model valueForKey:quarterName] valueForKey:@"must"]]];
    
}

- (void)layoutViews {
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self->contentLabel.mas_left).offset(-100);
        make.top.equalTo(self).offset(15);
        make.height.mas_equalTo(21);
    }];
    
    [moreImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self->contentLabel);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(18);
    }];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->titleLabel.mas_right).offset(30);
        make.right.equalTo(self->moreImageView.mas_left).offset(-5);
        make.top.equalTo(self).offset(14);
        make.height.mas_equalTo(21);
    }];
    
    [_seasonSubview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self->titleLabel.mas_bottom);
        make.height.mas_equalTo(56);
    }];
    
}

@end
