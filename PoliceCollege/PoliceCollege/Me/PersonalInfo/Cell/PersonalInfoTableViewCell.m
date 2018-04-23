//
//  PersonalInfoTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PersonalInfoTableViewCell.h"

@implementation PersonalInfoTableViewCell {
    UIImageView *imageView;
    UILabel *titleLabel;
    UILabel *contentLabel;
    UIImageView *moreImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [UIImageView new];
        titleLabel = [UILabel new];
        contentLabel = [UILabel new];
        moreImageView = [UIImageView new];
        [self addSubview:imageView];
        [self addSubview:titleLabel];
        [self addSubview:contentLabel];
        [self addSubview:moreImageView];
        [imageView setHidden:true];
        [imageView setImage:[UIImage imageNamed:@"portrait"]];
        [titleLabel setText:@"title"];
        [contentLabel setText:@"content"];
        [moreImageView setImage:[UIImage imageNamed:@"arrow"]];
        
        titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:16];
        titleLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1/1.0];
        
        contentLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:16];
        contentLabel.textColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:205/255.0 alpha:1/1.0];
        [contentLabel setTextAlignment:NSTextAlignmentRight];
        
        imageView.layer.cornerRadius = 38;
        imageView.layer.masksToBounds = YES;

    }
    return self;
}

- (void)layoutSubviews {
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-280);
        make.height.mas_equalTo(22);
        make.centerY.equalTo(self);
    }];
    
    [moreImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(18);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->moreImageView.mas_left).offset(-4);
        make.top.equalTo(self).offset(15);
        make.bottom.equalTo(self).offset(-15);
        make.width.mas_equalTo(76);
    }];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->titleLabel.mas_right).offset(30);
        make.right.equalTo(self->moreImageView.mas_left).offset(-5);
        make.top.equalTo(self).offset(14);
        make.bottom.equalTo(self).offset(-14);
    }];
}

-(void)setModel:(PersonalInfoModel *)model{
    
}


- (void)setImage:(UIImage *)image {
    if (_image != image) {
        _image = image;
        [imageView setImage:_image];
        [contentLabel setHidden:true];
        [imageView setHidden:false];
    }
}

//-(void)setTitle:(NSString *)title {
//    if (_title != title) {
//        _title = title;
//        [titleLabel setText:_title];
//    }
//}
//
//- (void)setContent:(NSString *)content {
//    if (_content != content) {
//        _content = content;
//        [contentLabel setText:_content];
//        [imageView setHidden:true];
//        [contentLabel setHidden:false];
//    }
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
