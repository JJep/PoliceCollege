//
//  ChangePasswordViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController () <UITextFieldDelegate>

@end

@implementation ChangePasswordViewController {
    UITextField *oldPassword;
    UITextField *newPassword;
    UIButton *confirmBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
}

-(void)initViews{
    
    self.title = @"修改密码";
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    oldPassword = [UITextField new];
    newPassword = [UITextField new];
    confirmBtn = [UIButton new];
    
    oldPassword.delegate = self;
    newPassword.delegate = self;
    
    [self.view addSubview:oldPassword];
    [self.view addSubview:newPassword];
    [self.view addSubview:confirmBtn];
    
    [oldPassword setPlaceholder:@"输入原密码"];
    [newPassword setPlaceholder:@"输入新密码"];
    [confirmBtn setBackgroundColor:rgb(74, 144, 226)];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    
    [oldPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(44);
        make.top.equalTo(self.view).offset(30);
    }];
    
    [newPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.height.equalTo(self->oldPassword);
        make.top.equalTo(self->oldPassword.mas_bottom).offset(15);
    }];
    
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(44);
        make.top.equalTo(self->newPassword.mas_bottom).offset(30);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:false];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [oldPassword resignFirstResponder];
    [newPassword resignFirstResponder];
    return true;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
