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
        
        titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        titleLabel.textColor = [UIColor colorWithRed:75/255.0 green:75/255.0 blue:75/255.0 alpha:1/1.0];
        
        contentLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        contentLabel.textColor = [UIColor colorWithRed:203/255.0 green:204/255.0 blue:205/255.0 alpha:1/1.0];
        
        [arrowImageView setImage:[UIImage imageNamed:@"arrow"]];

    }
    return self;
}

-(void)layoutSubviews {
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(24.2);
        make.width.mas_equalTo(self->imageView.mas_height);
        make.top.equalTo(self).offset(18.6);
        make.bottom.equalTo(self).offset(-18.6);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->imageView.mas_right).offset(18.1);
        make.top.equalTo(self).offset(19);
        make.bottom.equalTo(self).offset(-20);
        make.right.equalTo(self).offset(-200);
    }];
    
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-14.5);
        make.width.mas_equalTo(9);
        make.top.equalTo(self).offset(22);
        make.bottom.equalTo(self).offset(-22);
    }];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(self).offset(19);
        make.bottom.equalTo(self).offset(-19);
        make.width.mas_equalTo(100);
    }];
}

-(void)setImage:(UIImage *)image {
    if (_image != image) {
        _image = image;
        [imageView setImage:_image];
    }
}

-(void)setTitle:(NSString *)title {
    if (_title != title ) {
        _title = title ;
        [titleLabel setText:_title];
    }
}

-(void)setContent:(NSString *)content {
    if (_content != content) {
        _content = content;
        [contentLabel setText:_content];
        [arrowImageView setHidden:true];
    }
}

-(void)setModel:(MeTableViewModel *)model{
//    model = [MeTableViewModel ]
    model = [MeTableViewModel initWithDictionary:<#(NSDictionary *)#>]
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
