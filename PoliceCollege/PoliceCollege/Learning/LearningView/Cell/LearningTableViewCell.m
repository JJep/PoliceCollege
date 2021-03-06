//
//  LearningTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "LearningTableViewCell.h"

@implementation LearningTableViewCell {
    UIImageView *imageView;
    UILabel *titleLabel;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        imageView = [UIImageView new];
        titleLabel = [UILabel new];
        [self addSubview:imageView];
        [self addSubview:titleLabel];
        [titleLabel setText:@"title"];
        [imageView setImage:[UIImage imageNamed:@"banner"]];
        imageView.layer.cornerRadius = 25;
        imageView.layer.masksToBounds = YES;
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        titleLabel.text = @"在线测试";
        titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        titleLabel.textColor = [UIColor colorWithRed:94/255.0 green:89/255.0 blue:91/255.0 alpha:1/1.0];

        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self);
            make.bottom.equalTo(self->titleLabel.mas_top).offset(-8);
        }];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(16);
        }];
    }
    return self;

}

- (void)setImage:(UIImage *)image  {
    if (_image != image) {
        _image = image;
        [imageView setImage:_image];
    }
}


-(void)setTitle:(NSString *)title {
    if (_title != title) {
        _title = title;
        [titleLabel setText:_title];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
