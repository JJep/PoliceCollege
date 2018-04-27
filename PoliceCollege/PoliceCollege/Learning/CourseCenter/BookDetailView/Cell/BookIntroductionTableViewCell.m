//
//  BookIntroductionTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "BookIntroductionTableViewCell.h"
@implementation BookIntroductionTableViewCell {
    UILabel *contentLabel;
    NSString *_content;
    UILabel *introductionLabel;
    UILabel *chapterLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        contentLabel = [UILabel new];
        introductionLabel = [UILabel new];
        chapterLabel = [UILabel new];
        [self addSubview:introductionLabel];
        [self addSubview:chapterLabel];
        [self addSubview:contentLabel];
        
        [introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self).offset(17);
            make.right.equalTo(self).offset(-15);
//            make.height.mas_equalTo(20);
        }];
//
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.top.equalTo(self->introductionLabel.mas_bottom).offset(8);
//            make.top.equalTo(self).offset(8);
//            make.bottom.equalTo(self).offset(-8);
        }];
//
        [chapterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->contentLabel.mas_bottom).offset(9);
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.bottom.equalTo(self).offset(-10);
        }];
        
        
        [contentLabel setNumberOfLines:0];
        contentLabel.text = @"“这已不是冷战，而是冰战。”对于美国愈演愈烈的反俄行动，有俄罗斯议员这样表示。当地时间6日，美国再次向俄罗斯挥动制裁大棒，包括多名俄罗斯高官、富豪以及国防出口公司在内的38个个人及实体上榜。这被认为是特朗普政府迄今对俄罗斯采取的最严厉的一次制裁措施，美国高级官员形容，制裁对象多是普京“核心圈子”成员。（4月8日环球网）";
        contentLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        contentLabel.textColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1/1.0];
        
        [introductionLabel setNumberOfLines:0];
        [introductionLabel setText:@"内容简介:"];
        introductionLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:13];
        introductionLabel.textColor = [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1/1.0];

        [chapterLabel setNumberOfLines:0];
        [chapterLabel setText:@"章节信息:"];
        chapterLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:13];
        chapterLabel.textColor = [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1/1.0];

    }
    return self;
}

- (void)setContent:(NSString *)content {
    if (_content != content) {
        _content = content;
        [contentLabel setText:_content];
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
