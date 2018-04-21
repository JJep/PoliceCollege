//
//  MeViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MeView.h"
#import "MePortraitButton.h"
@implementation MeView {
    MePortraitButton *portraitButton;
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        portraitButton = [MePortraitButton new];
        [self addSubview:portraitButton];
        
    }
    return self;
}

-(void)layoutSubviews {
    [portraitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(201);
    }];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
