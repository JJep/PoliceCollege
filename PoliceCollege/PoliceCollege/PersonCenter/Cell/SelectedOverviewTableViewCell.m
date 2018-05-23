//
//  SelectedOverviewTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SelectedOverviewTableViewCell.h"
#import "VideoOverview.h"
#import "CourseOverview.h"
#import "BookOverview.h"
@implementation SelectedOverviewTableViewCell {
    UILabel *lastTimeLabel;
    UIView *view;
    UILabel *learningProgressTitleLabel;
    UILabel *learningProgressLabel;
    UILabel *creditTitleLabel;
    UILabel *creditLabel;
    UILabel *commentTitleLabel;
    UILabel *commentLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _selectedCoursesTitleLabel = [UILabel new];
        lastTimeLabel = [UILabel new];
        view = [UIView new];
        learningProgressTitleLabel = [UILabel new];
        learningProgressLabel = [UILabel new];
        creditTitleLabel = [UILabel new];
        creditLabel = [UILabel new];
        commentTitleLabel = [UILabel new];
        commentLabel = [UILabel new];
        
        [self addSubview:_selectedCoursesTitleLabel];
        [self addSubview:lastTimeLabel];
        [self addSubview:view];
        [self addSubview:learningProgressLabel];
        [self addSubview:learningProgressTitleLabel];
        [self addSubview:creditTitleLabel];
        [self addSubview:creditLabel];
        [self addSubview:commentTitleLabel];
        [self addSubview:commentLabel];
        
        [view setBackgroundColor:rgba(238,238,238,1)];
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = true;
        
        _selectedCoursesTitleLabel.text = @"已选课程";
        _selectedCoursesTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:15];
        _selectedCoursesTitleLabel.textColor = [UIColor colorWithRed:18/255.0 green:18/255.0 blue:18/255.0 alpha:1/1.0];
        
        [lastTimeLabel setTextAlignment:NSTextAlignmentRight];
        lastTimeLabel.text = @"最近上课时间 2018-04-08 10:30";
        lastTimeLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        lastTimeLabel.textColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:205/255.0 alpha:1/1.0];
        
        learningProgressLabel.text = @"5/8";
        learningProgressLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:25];
        learningProgressLabel.textColor = [UIColor colorWithRed:88/255.0 green:162/255.0 blue:245/255.0 alpha:1/1.0];
        [learningProgressLabel setTextAlignment:NSTextAlignmentCenter];
        
        learningProgressTitleLabel.text = @"学习进度";
        learningProgressTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        learningProgressTitleLabel.textColor = [UIColor colorWithRed:88/255.0 green:162/255.0 blue:245/255.0 alpha:1/1.0];
        [learningProgressTitleLabel setTextAlignment:NSTextAlignmentCenter];
        
        creditLabel.text = @"5/8";
        creditLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:25];
        creditLabel.textColor = [UIColor colorWithRed:88/255.0 green:162/255.0 blue:245/255.0 alpha:1/1.0];
        [creditLabel setTextAlignment:NSTextAlignmentCenter];
        
        commentLabel.text = @"5/8";
        commentLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:25];
        commentLabel.textColor = [UIColor colorWithRed:88/255.0 green:162/255.0 blue:245/255.0 alpha:1/1.0];
        [commentLabel setTextAlignment:NSTextAlignmentCenter];
        
        creditTitleLabel.text = @"学习学分";
        creditTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        creditTitleLabel.textColor = [UIColor colorWithRed:88/255.0 green:162/255.0 blue:245/255.0 alpha:1/1.0];
        [creditTitleLabel setTextAlignment:NSTextAlignmentCenter];
        
        commentTitleLabel.text = @"评论学分";
        commentTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        commentTitleLabel.textColor = [UIColor colorWithRed:88/255.0 green:162/255.0 blue:245/255.0 alpha:1/1.0];
        [commentTitleLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self layoutViews];
    }
    return self;
}


- (void)layoutViews {
    [_selectedCoursesTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(15);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
    
    [lastTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-20);
        //        make.bottom.equalTo(self.selectedCoursesTitleLabel);
        make.center.equalTo(self.selectedCoursesTitleLabel);
        make.left.equalTo(self->_selectedCoursesTitleLabel.mas_right).offset(20);
        make.height.mas_equalTo(20);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_selectedCoursesTitleLabel.mas_bottom).offset(11);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.mas_equalTo(1);
    }];
    
    [learningProgressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->view).offset(11);
        make.left.equalTo(self);
        make.width.equalTo(self->creditLabel);
        make.right.equalTo(self->creditLabel.mas_left);
    }];
    
    [creditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->learningProgressLabel);
        make.width.equalTo(self->commentLabel);
        make.right.equalTo(self->commentLabel.mas_left);
    }];
    
    [commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->creditLabel);
        make.right.equalTo(self);
    }];
    
    [learningProgressTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.equalTo(self->learningProgressLabel);
        make.top.equalTo(self->learningProgressLabel.mas_bottom);
        make.bottom.equalTo(self).offset(-25);
    }];
    
    [creditTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.equalTo(self->creditLabel);
        make.top.equalTo(self->creditLabel.mas_bottom);
        make.bottom.equalTo(self->learningProgressTitleLabel);
    }];
    
    [commentTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.equalTo(self->commentLabel);
        make.top.equalTo(self->commentLabel.mas_bottom);
        make.bottom.equalTo(self->learningProgressTitleLabel);
    }];
}


- (void)setModel:(id)model {
    if ([[model class] isEqual:[VideoOverview class]]) {
        [self.selectedCoursesTitleLabel setText:@"已选视频"];
    } else if ([[model class] isEqual:[CourseOverview class]]) {
        [self.selectedCoursesTitleLabel setText:@"已选课程"];
    } else {
        [self.selectedCoursesTitleLabel setText:@"已选图书"];
    }
    VideoOverview *videoOverview = (VideoOverview *)model;
    [creditLabel setText:[NSString stringWithFormat:@"%.1lf/%.1lf",videoOverview.creditHave,videoOverview.credit]];
    [commentLabel setText:[NSString stringWithFormat:@"%.1lf/%.1lf",videoOverview.ccreditHave,videoOverview.ccredit]];
    [learningProgressLabel setText:[NSString stringWithFormat:@"%lu/%lu", videoOverview.over,videoOverview.have]];
    [lastTimeLabel setText: [NSString stringWithFormat:@"最近上课时间 %@",[self getDateStringWithTime:videoOverview.lastTime]]];
}

- (NSString *)getDateStringWithTime:(NSTimeInterval)time {
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}

//-(void)setFrame:(CGRect)frame
//{
//    //设置cell之间的jian j
//    frame.origin.x = 15;
//    frame.size.width -= 2 * frame.origin.x;
//    frame.size.height -= 2 * frame.origin.x;
//    [super setFrame:frame];
//}

@end
