//
//  MeItemTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MeItemTableViewCell.h"

@implementation MeItemTableViewCell {
    UIImageView *imageView;
    UILabel *titleLabel;
    UIImageView *arrowImageView;
    UILabel *contentLabel;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [UIImageView new];
        titleLabel = [UILabel new];
        arrowImageView = [UIImageView new];
        contentLabel = [UILabel new];
        
        [self addSubview:contentLabel];
        [self addSubview:imageView];
        [self addSubview:titleLabel];
        [self addSubview:arrowImageView];
    }
    return self;
}

-(void)layoutSubviews {
    
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
