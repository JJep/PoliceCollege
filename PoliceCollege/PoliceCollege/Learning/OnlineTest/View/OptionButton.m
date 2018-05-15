//
//  OptionButton.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/15.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "OptionButton.h"

@implementation OptionButton {
    UIView *fillView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        
        self.layer.borderWidth = 2.0f;
        self.layer.borderColor = MyLightGrayColor.CGColor;
        self.layer.cornerRadius = 12.5;
        self.layer.masksToBounds = true;
//        self.layer.backgroundColor = rgba(74,144,226,1).CGColor;
        
        fillView = [UIView new];
        [self addSubview:fillView];
        [fillView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(5);
            make.right.equalTo(self).offset(-5);
            make.top.equalTo(self).offset(5);
            make.bottom.equalTo(self).offset(-5);
        }];
        
        fillView.layer.cornerRadius = 7.5;
        fillView.layer.masksToBounds = true;
        fillView.layer.backgroundColor = rgba(74,144,226,1).CGColor;
        [fillView setUserInteractionEnabled:NO];
        [fillView setHidden:true];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [fillView setHidden:!selected];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
