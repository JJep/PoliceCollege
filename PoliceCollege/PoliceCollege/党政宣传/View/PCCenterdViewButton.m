//
//  CenterdViewButton.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCCenterdViewButton.h"

@implementation PCCenterdViewButton {
    UIImageView *buttonImageView;
    UILabel *buttonLabel;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        buttonImageView = [UIImageView new];
        buttonLabel = [UILabel new];
        [buttonImageView setImage:_image];
        [buttonLabel setText:_labelStr];
        buttonLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        buttonLabel.textColor = [UIColor colorWithRed:47/255.0 green:132/255.0 blue:228/255.0 alpha:1/1.0];
    
        [self addSubview:buttonLabel];
        [self addSubview:buttonImageView];
    }
    return self;
}

-(void)layoutSubviews {
    [buttonImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(27);
        make.centerX.equalTo(self);
        make.top.equalTo(self.mas_top).offset(8.5);
    }];
    
    [buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->buttonImageView.mas_bottom).offset(9);
        make.width.mas_equalTo(52);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-8.5);
    }];
}

-(void)setImage:(UIImage *)image{
    if (_image!=image) {
        _image = image;
        [buttonImageView setImage:_image];
    }
}

-(void)setLabelStr:(NSString *)labelStr {
    if (labelStr!=_labelStr) {
        _labelStr = labelStr;
        [buttonLabel setText:_labelStr];
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
