//
//  CourseCenterTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "BookCenterTableViewCell.h"
#import "BookOverview.h"
#import "Course.h"
@implementation BookCenterTableViewCell {
    UIImageView *imageView;
    UILabel *bookNameLabel;
    UILabel *authorNameLabel;
    UILabel *bookTimeLabel;
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
        bookNameLabel = [UILabel new];
        authorNameLabel = [UILabel new];
        bookTimeLabel = [UILabel new];
        creditLabel = [UILabel new];
        scoreLabel = [UILabel new];
        clicksLabel = [UILabel new];
        commentsQuantityLabel = [UILabel new];
        startLearningBtn = [UIButton new];
        
        [self addSubview:imageView];
        [self addSubview:bookTimeLabel];
        [self addSubview:authorNameLabel];
        [self addSubview:bookNameLabel];
        [self addSubview:creditLabel];
        [self addSubview:scoreLabel];
        [self addSubview:clicksLabel];
        [self addSubview:commentsQuantityLabel];
        [self addSubview:startLearningBtn];
        
        [imageView setImage:[UIImage imageNamed:@"banner"]];
        bookNameLabel.text = @"中国震憾入门课";
        bookNameLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:18];
        bookNameLabel.textColor = [UIColor colorWithRed:11/255.0 green:11/255.0 blue:11/255.0 alpha:1/1.0];

        authorNameLabel.text = @"张维维";
        authorNameLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        authorNameLabel.textColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1/1.0];
        
        bookTimeLabel.text = @"2018-04-07 2:30";
        bookTimeLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        bookTimeLabel.textColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1/1.0];

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

- (void)setModel:(id)model {
    [self setModel:model isSelected:NO];
}

- (void)setModel:(id)model isSelected:(BOOL)isSelected
{
    if (isSelected) {
        Book *book = (Book *)model;
        [imageView sd_setImageWithURL:[NSURL pc_imageURLWithString:book.img] placeholderImage:[UIImage imageNamed:@"banner"]];
        [startLearningBtn setTitle:book.progress forState:UIControlStateNormal];
        [bookNameLabel setText:book.title];
        [authorNameLabel setText:book.teacher];
        [bookTimeLabel setText:book.learnTime];
    } else if ([[model class] isEqual:[Book class]]){
        Book *book = (Book *)model;
        [imageView sd_setImageWithURL:[NSURL pc_imageURLWithString:book.img] placeholderImage:[UIImage imageNamed:@"banner"]];
        [bookNameLabel setText:book.title];
        [authorNameLabel setText:book.author];
        [bookTimeLabel setText:book.published];
    } else {
        Course *course = (Course *)model;
        [imageView sd_setImageWithURL:[NSURL pc_imageURLWithString:course.img] placeholderImage:[UIImage imageNamed:@"banner"]];
        [bookNameLabel setText:course.title];
        [authorNameLabel setText:course.teacher];
        [bookTimeLabel setText:course.published];
    }
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
    
    [bookNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->imageView.mas_right).offset(15);
        make.top.equalTo(self).offset(15);
        make.right.equalTo(self->startLearningBtn.mas_left).offset(-15);
    }];
    
    [authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->imageView.mas_right).offset(15);
        make.top.equalTo(self->bookNameLabel.mas_bottom).offset(4);
        make.right.equalTo(self).offset(-20);
    }];
    
    [bookTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->imageView.mas_right).offset(15);
        make.top.equalTo(self->authorNameLabel.mas_bottom).offset(3);
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
@end
