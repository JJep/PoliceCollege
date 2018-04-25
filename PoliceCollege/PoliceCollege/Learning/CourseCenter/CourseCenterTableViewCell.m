//
//  CourseCenterTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "CourseCenterTableViewCell.h"

@implementation CourseCenterTableViewCell {
    UIImageView *imageView;
    UILabel *courseNameLabel;
    UILabel *teacherNameLabel;
    UILabel *courseTimeLabel;
    UILabel *creditLabel;
    UILabel *scoreLabel;
    UILabel *clicksLabel;
    UILabel *commentsQuantityLabel;
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
        
        creditLabel.text = @"学习 0.5分";
        creditLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        creditLabel.textColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1/1.0];

        NSString * text = @"今天天气好晴朗,嘿!处处百花香,嘿嘿嘿!!!明天星期二,后天就是星期三,再有两天就又放假咯!吼吼吼~~~";
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
        NSDictionary *attributeDict = @{NSFontAttributeName: [UIFont systemFontOfSize:18.0],
                                        NSForegroundColorAttributeName: [UIColor redColor]};
        NSDictionary *attributeDict1 = @{NSFontAttributeName: [UIFont systemFontOfSize:23.0],
                                         NSForegroundColorAttributeName: [UIColor colorWithRed:0.130 green:0.854 blue:0.345 alpha:1.000]};
        [attrStr setAttributes:attributeDict1 range:NSMakeRange(0, 7)];
        [attrStr setAttributes:attributeDict range:NSMakeRange(7, attrStr.length -7)];


    }
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
