//
//  CenterdView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCCenterdView.h"
#import "PCCenterdViewButton.h"
#define leftBtnTag 123
#define centerBtnTar 1234
#define rightBtnTag 12345
@implementation PCCenterdView
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        _leftBtn = [PCCenterdViewButton new];
        _centerBtn = [PCCenterdViewButton new];
        _rightBtn = [PCCenterdViewButton new];
        
        [self addSubview:_leftBtn];
        [self addSubview:_centerBtn];
        [self addSubview:_rightBtn];
        
        [_leftBtn setImage:[UIImage imageNamed:@"announcement"]];
        [_leftBtn setLabelStr:@"通知公告"];
        [_centerBtn setImage:[UIImage imageNamed:@"publicCourseware"]];
        [_centerBtn setLabelStr:@"公开课件"];
        
        [_rightBtn setImage:[UIImage imageNamed:@"publicVideo"]];
        [_rightBtn setLabelStr:@"公开视频"];
        

        
    }
    return self;
}



-(void)layoutSubviews {
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(34);
        make.width.equalTo(self->_centerBtn);
        make.width.equalTo(self->_rightBtn);
        make.right.equalTo(self->_centerBtn.mas_left).offset(-34);
        make.height.mas_equalTo(65);
        make.centerY.equalTo(self);
    }];
    
    [_centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self->_leftBtn);
        make.right.equalTo(self->_rightBtn.mas_left).offset(-34);
        make.centerY.equalTo(self);
    }];
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self->_centerBtn);
        make.right.equalTo(self.mas_right).offset(-34);
        make.centerY.equalTo(self);
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
