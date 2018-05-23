//
//  VideoTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/27.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "VideoTableViewCell.h"

@implementation VideoTableViewCell {
    UIImageView *imageView;
    UILabel *courseNameLabel;
    UILabel *teacherNameLabel;
    UILabel *courseTimeLabel;
    UILabel *creditLabel;
    UILabel *scoreLabel;
    UILabel *clicksLabel;
    UILabel *commentsQuantityLabel;
    NSMutableAttributedString *creditStr;
    NSMutableAttributedString *scoreStr;
    NSMutableAttributedString *clicksStr;
    NSMutableAttributedString *commentsQuantityStr;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [UIImageView new];
        courseNameLabel = [UILabel new];
        teacherNameLabel = [UILabel new];
        courseTimeLabel = [UILabel new];
        creditLabel = [UILabel new];
        scoreLabel = [UILabel new];
        clicksLabel = [UILabel new];
        commentsQuantityLabel = [UILabel new];
        
        [self addSubview:imageView];
        [self addSubview:courseTimeLabel];
        [self addSubview:teacherNameLabel];
        [self addSubview:courseNameLabel];
        [self addSubview:creditLabel];
        [self addSubview:scoreLabel];
        [self addSubview:clicksLabel];
        [self addSubview:commentsQuantityLabel];
        
        [imageView setImage:[UIImage imageNamed:@"banner"]];
        courseNameLabel.text = @"中国震憾入门课";
        courseNameLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:18];
        courseNameLabel.textColor = [UIColor colorWithRed:11/255.0 green:11/255.0 blue:11/255.0 alpha:1/1.0];
        
        teacherNameLabel.text = @"张维维";
        teacherNameLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        teacherNameLabel.textColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1/1.0];
        
        courseTimeLabel.text = @"2018-04-07 2:30";
        courseTimeLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        courseTimeLabel.textColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1/1.0];
        
        creditStr = [[NSMutableAttributedString alloc] initWithString:@"学分 0.5分"];
        NSDictionary *attributeDict = @{NSForegroundColorAttributeName : rgb(95,157,230)};
        [creditStr setAttributes:attributeDict range:NSMakeRange(3, 4)];
        creditLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        [creditLabel setAttributedText:creditStr];
        [creditLabel setTextAlignment:NSTextAlignmentCenter];
        
        scoreStr = [[NSMutableAttributedString alloc] initWithString:@"评分 0.5分"];
        [scoreStr setAttributes:attributeDict range:NSMakeRange(3, 4)];
        scoreLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        [scoreLabel setAttributedText:scoreStr];
        [scoreLabel setTextAlignment:NSTextAlignmentCenter];
        
        clicksStr = [[NSMutableAttributedString alloc] initWithString:@"点击量 0.5"];
        [clicksStr setAttributes:attributeDict range:NSMakeRange(4, 3)];
        clicksLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        [clicksLabel setAttributedText:clicksStr];
        [clicksLabel setTextAlignment:NSTextAlignmentCenter];
        
        commentsQuantityStr = [[NSMutableAttributedString alloc] initWithString:@"评论 11"];
        [commentsQuantityStr setAttributes:attributeDict range:NSMakeRange(3, 2)];
        commentsQuantityLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        [commentsQuantityLabel setAttributedText:commentsQuantityStr];
        [commentsQuantityLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self layoutViews];
        
    }
    return self;
}

- (void)layoutViews {
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self).offset(15);
        make.height.mas_equalTo(87);
        make.width.mas_equalTo(120);
    }];
    
    [courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->imageView.mas_right).offset(15);
        make.top.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
    }];
    
    [teacherNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->imageView.mas_right).offset(15);
        make.top.equalTo(self->courseNameLabel.mas_bottom).offset(4);
        make.right.equalTo(self).offset(-20);
    }];
    
    [courseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->imageView.mas_right).offset(15);
        make.top.equalTo(self->teacherNameLabel.mas_bottom).offset(3);
        make.right.equalTo(self).offset(-15);
    }];
    
    [creditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self->imageView.mas_bottom).offset(11);
        make.bottom.equalTo(self).offset(-10);
        make.right.equalTo(self->scoreLabel.mas_left).offset(-10);
        make.width.equalTo(self->scoreLabel);
    }];
    
    [scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-10);
        make.right.equalTo(self->clicksLabel.mas_left).offset(-10);
        make.width.equalTo(self->clicksLabel);
    }];
    
    [clicksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-10);
        make.height.mas_equalTo(16);
        make.right.equalTo(self->commentsQuantityLabel.mas_left).offset(-10);
        make.width.equalTo(self->commentsQuantityLabel);
    }];
    
    [commentsQuantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-10);
        make.height.mas_equalTo(16);
        make.right.equalTo(self).offset(-15);
    }];
    
}

- (void)setModel:(Video *)model {
    [teacherNameLabel setText:model.teacher];
    [imageView sd_setImageWithURL:[NSURL pc_imageURLWithString:model.img] placeholderImage:[UIImage imageNamed:@"banner"]];
    [courseNameLabel setText:model.title];
    [courseTimeLabel setText:model.published];
    [creditLabel setText: [NSString stringWithFormat:@"学分 %lf",model.credit]];
    [scoreLabel setText: [NSString stringWithFormat:@"评分 %lf",model.ccredit]];
    [clicksLabel setText:[NSString stringWithFormat:@"点击量 %lu", model.hit]];
    [commentsQuantityLabel setText:[NSString stringWithFormat:@"评论 %lu", model.commentNum]];
    
}

@end
