//
//  ChapterTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "ChapterTableViewCell.h"

@implementation ChapterTableViewCell {
    UILabel *chapterNameLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        chapterNameLabel = [UILabel new];
        [self.contentView addSubview:chapterNameLabel];
        chapterNameLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        chapterNameLabel.textColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1/1.0];

        [chapterNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(8);
            make.bottom.equalTo(self.contentView).offset(-8);
        }];
    }
    return self;
}

- (void)setModel:(Chapter *)model {
    [chapterNameLabel setText:model.name];
}

@end
