//
//  PCLoginView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCLoginView.h"
#import "UITextfieldView.h"
#import <Masonry.h>
@interface PCLoginView ()
@end

@implementation PCLoginView {
    UILabel *lbTitle;
    UIImageView *backView;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        backView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [backView setImage:[UIImage imageNamed:@"backView"]];
        [self addSubview:backView];
        
        UIView *view = [[UIView alloc] initWithFrame:backView.bounds];
        //    [view setBackgroundColor:[UIColor colorWithHexString:@"4A90E2" alpha:0.3]];
        [view setBackgroundColor:[UIColor colorWithRed: 74/255.0 green:144/255.0 blue:226/255.0 alpha:0.5]];
        
        [backView addSubview:view];
        
        lbTitle = [[UILabel alloc] init];
        [lbTitle setText:@"警察学院"];
        [lbTitle setTextColor:[UIColor whiteColor]];
        lbTitle.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:32];
        [backView addSubview:lbTitle];
    
        
        _userNameTextField = [[UITextfieldView alloc] init];
        _userNameTextField.image = [UIImage imageNamed:@"user"];
        _userNameTextField.placeHolderText = @"请输入账户";
        [backView addSubview:_userNameTextField];
        
        _passwordTextField = [[UITextfieldView alloc] init];
        _passwordTextField.image = [UIImage imageNamed:@"password"];
        _passwordTextField.placeHolderText = @"请输入密码";
        [backView addSubview:_passwordTextField];
        
        backView.userInteractionEnabled = YES;//让UItextfield的父视图接受交互，不谈UItextfield会没有响应
        _passwordTextField.secure = YES;
        
        _loginBtn = [UIButton new] ;
        [_loginBtn setBackgroundColor:[UIColor whiteColor]];
        [_loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
        [_loginBtn.titleLabel setFont:[UIFont fontWithName:@"PingFang-SC-Semibold" size:15]];
        [_loginBtn setTitleColor:
         [UIColor colorWithRed:74/255.0 green:144/255.0 blue:226/255.0 alpha:1/1.0]
                        forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 1;
        [backView addSubview:_loginBtn];
        
        _userNameTextField.layer.cornerRadius = 3;
        _userNameTextField.layer.masksToBounds = YES;
        _passwordTextField.layer.cornerRadius = 3;
        _passwordTextField.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 3;
        

    }
    return self;
}

- (void)layoutSubviews {
    [lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).offset(114);
        make.centerX.equalTo(self->backView);
        make.width.mas_equalTo(128);
        make.height.mas_equalTo(45);
    }];
    
    [_userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->lbTitle.mas_bottom).offset(85);
        make.left.equalTo(self->backView.mas_left).offset(30);
        make.right.equalTo(self->backView.mas_right).offset(-30);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(315);
        make.centerX.equalTo(self->backView);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.left.right.width.height.equalTo(self.userNameTextField);
        make.top.equalTo(self.userNameTextField.mas_bottom).offset(15);
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.passwordTextField);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(30);
        make.height.mas_equalTo(45);
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
