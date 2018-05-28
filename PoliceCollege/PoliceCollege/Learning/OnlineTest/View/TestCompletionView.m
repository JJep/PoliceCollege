//
//  TestCompletionView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "TestCompletionView.h"

@implementation TestCompletionView
- (instancetype)initWithCurrentScore:(NSInteger)currentScore totalScore:(NSInteger)totalScore {
    if (self = [super init]) {
        UIImageView *backImageView = [[UIImageView alloc] init];
        [backImageView setImage:[UIImage imageNamed:@"testBackImage"]];
        [self addSubview:backImageView];
        [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        UILabel *resLabel = [[UILabel alloc] init];
        [backImageView addSubview:resLabel];
        resLabel.text = @"测试结果";
        resLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:24];
        resLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        resLabel.textAlignment = NSTextAlignmentCenter;
        [resLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(backImageView).offset(30);
            make.centerX.equalTo(backImageView);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(35);
        }];
        
        UILabel *rightLabel = [[UILabel alloc] init];
        [backImageView addSubview:rightLabel];
        rightLabel.text = @"答对";
        rightLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        rightLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        rightLabel.textAlignment = NSTextAlignmentCenter;
        [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(resLabel.mas_bottom).offset(20);
            make.centerX.equalTo(backImageView);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(25);
        }];
        
        UILabel *currentScoreLabel = [[UILabel alloc] init];
        [backImageView addSubview:currentScoreLabel];
        currentScoreLabel.text = [NSString stringWithFormat:@"%lu分", currentScore];
        currentScoreLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:50];
        currentScoreLabel.textColor = [UIColor colorWithRed:100/255.0 green:255/255.0 blue:0/255.0 alpha:1/1.0];
        currentScoreLabel.textAlignment = NSTextAlignmentCenter;
        [currentScoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(backImageView);
            make.top.equalTo(rightLabel.mas_bottom);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(75);
        }];
        
        UILabel *totalScoreLabel = [[UILabel alloc] init];
        [backImageView addSubview:totalScoreLabel];
        totalScoreLabel.textAlignment = NSTextAlignmentCenter;
        totalScoreLabel.text = [NSString stringWithFormat:@"%lu分", totalScore];
        totalScoreLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        totalScoreLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
        [totalScoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(currentScoreLabel.mas_bottom);
            make.centerX.equalTo(backImageView);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(25);
        }];
        
        UIImageView *starImageView = [[UIImageView alloc] init];
        [backImageView addSubview:starImageView];
        [starImageView setImage:[UIImage imageNamed:@"testStarImage"]];
        [starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(totalScoreLabel.mas_bottom).offset(36);
            make.centerX.equalTo(backImageView);
            make.height.mas_equalTo(145);
            make.width.mas_equalTo(130);
        }];
        
        UILabel *betterLabel = [[UILabel alloc] init];
        [backImageView addSubview:betterLabel];
        betterLabel.text = @"你可以做的更好哦！";
        betterLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        betterLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.6/1.0];
        betterLabel.textAlignment = NSTextAlignmentCenter;
        [betterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(140);
            make.height.mas_equalTo(25);
            make.top.equalTo(starImageView.mas_bottom).offset(25);
            make.centerX.equalTo(backImageView);
        }];
        
        self.completeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backImageView setUserInteractionEnabled:YES];
        [backImageView addSubview:self.completeButton];
        [self.completeButton setBackgroundColor:[UIColor whiteColor]];
        self.completeButton.layer.cornerRadius = 22.5;
        self.completeButton.layer.masksToBounds = YES;
        [self.completeButton setTitle:@"完成测试" forState:UIControlStateNormal];
        [self.completeButton setTitleColor:rgba(74,144,226,1) forState:UIControlStateNormal];
        [self.completeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(betterLabel.mas_bottom).offset(70);
            make.width.mas_equalTo(180);
            make.centerX.equalTo(backImageView);
            make.height.mas_equalTo(45);
        }];
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
