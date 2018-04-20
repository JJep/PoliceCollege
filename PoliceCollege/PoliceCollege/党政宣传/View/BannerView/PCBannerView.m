//
//  BannerView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCBannerView.h"

@implementation PCBannerView {
    UIImageView *imageView;
}
@synthesize image = _image;
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        imageView = [UIImageView new];
        [imageView setImage:self.image];
        [self addSubview:imageView];
    }
    return self;
}

-(void)layoutSubviews {
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
}

-(UIImage *)image {
    if (!_image) {
        return [UIImage imageNamed:@"bassJackers"];
    }
    return _image;
}

-(void)setImage:(UIImage *)image {
    if (image!= _image) {
        _image = image;
        [imageView setImage:_image];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
