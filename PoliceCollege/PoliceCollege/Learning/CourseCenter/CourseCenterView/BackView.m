//
//  CourseBackView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "BackView.h"

@implementation BackView {
    UIImageView *imageView;
    UILabel *nameLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        imageView = [[UIImageView alloc] initWithImage:_image];
        nameLabel = [UILabel new];
        [self addSubview:imageView];
        [self addSubview:nameLabel];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.mas_equalTo(self.image.size);
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->imageView.mas_bottom).offset(30);
            make.centerX.equalTo(self);
        }];
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    if (_image != image) {
        _image = image;
        [imageView setImage:_image];
    }
}

- (void)setName:(NSString *)name {
    if (_name != name) {
        _name = name;
        [nameLabel setText:_name];
    }
}

@end
