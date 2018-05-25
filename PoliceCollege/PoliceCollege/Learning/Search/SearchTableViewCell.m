//
//  SearchTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchTableViewCell.h"
#import "Course.h"
#import "Book.h"
#import "Video.h"
#import "BookCenterTableViewCell.h"
#import "VideoTableViewCell.h"
#import "SearchModel.h"
@implementation SearchTableViewCell

+ (instancetype)initWithModel:(SearchModel *)model {
    SearchTableViewCell *cell ;
    if ([[model class] isEqual:[Video class]]) {
        cell = [[VideoTableViewCell alloc] init];
    } else {
        cell = [[BookCenterTableViewCell alloc] init];
    }
    return cell;
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
