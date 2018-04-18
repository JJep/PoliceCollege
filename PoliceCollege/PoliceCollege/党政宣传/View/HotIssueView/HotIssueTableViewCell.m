//
//  HotIssueTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "HotIssueTableViewCell.h"

@implementation HotIssueTableViewCell {
    UIImageView *imageView;
    UILabel *title;
    UILabel *lbTime;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    imageView = [UIImageView new];
    title = [UILabel new];
    lbTime = [UILabel new];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
