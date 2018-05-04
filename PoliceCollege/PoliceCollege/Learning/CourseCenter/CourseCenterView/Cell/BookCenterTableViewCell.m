//
//  CourseCenterTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "BookCenterTableViewCell.h"

@implementation BookCenterTableViewCell {
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
    UIButton *startLearningBtn;
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
        startLearningBtn = [UIButton new];
        
        [self addSubview:imageView];
        [self addSubview:courseTimeLabel];
        [self addSubview:teacherNameLabel];
        [self addSubview:courseNameLabel];
        [self addSubview:creditLabel];
        [self addSubview:scoreLabel];
        [self addSubview:clicksLabel];
        [self addSubview:commentsQuantityLabel];
        [self addSubview:startLearningBtn];
        
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
        
        [startLearningBtn setTitle:@"开始学习" forState:UIControlStateNormal];
        [startLearningBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [startLearningBtn setTitleColor:rgb(95,157,230) forState:UIControlStateNormal];
        [startLearningBtn.layer setBorderColor:rgb(95,157,230).CGColor];
        [startLearningBtn.layer setBorderWidth:1.0];
        startLearningBtn.layer.cornerRadius = 5;
        startLearningBtn.layer.masksToBounds = true;
        
        [self layoutViews];

    }
    return self;
}

- (void)layoutViews {
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self).offset(15);
//        make.bottom.equalTo(self).offset(-15);
        make.height.mas_equalTo(110);
        make.bottom.equalTo(self).offset(-15);
        make.width.mas_equalTo(82);
    }];
    
    [courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->imageView.mas_right).offset(15);
        make.top.equalTo(self).offset(15);
        make.right.equalTo(self->startLearningBtn.mas_left).offset(-15);
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
        make.left.equalTo(self->imageView.mas_right).offset(10);
        make.bottom.equalTo(self).offset(-15);
        make.right.equalTo(self->scoreLabel.mas_left).offset(-10);
        make.width.equalTo(self->scoreLabel);
    }];
    
    [scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-15);
        make.right.equalTo(self->clicksLabel.mas_left).offset(-10);
        make.width.equalTo(self->clicksLabel);
    }];
    
    [clicksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-15);
        make.right.equalTo(self->commentsQuantityLabel.mas_left).offset(-10);
        make.width.equalTo(self->commentsQuantityLabel);
    }];
    
    [commentsQuantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-15);
        make.right.equalTo(self).offset(-15);
    }];
    
    [startLearningBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(15);
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(26);
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
