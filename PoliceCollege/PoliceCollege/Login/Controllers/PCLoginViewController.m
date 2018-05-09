//
//  PCLoginViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCLoginViewController.h"
#import "UITextfieldView.h"
#import "PCLoginView.h"
#import "PCLoginViewModel.h"
#import "UITextfieldView.h"
#import "PCUserModel.h"
#import <NSObject+YYModel.h>
#import "User.h"
#import "JMUserLocalData.h"
#import "PCAlertControllerViewController.h"
@interface PCLoginViewController ()
@end

@implementation PCLoginViewController {
    PCLoginView *loginView;
    PCLoginViewModel *viewModel;
    User *user;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    viewModel = [[PCLoginViewModel alloc] init];
    
    [self createView];
}

- (void)createView {
    loginView = [[PCLoginView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [loginView.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginView];
}

- (void)login {
    [viewModel loginAction:loginView.userNameTextField.text password:loginView.passwordTextField.text success:^(id responseObject) {
        NSLog(@"%@", responseObject);
        if ([[responseObject objectForKey:@"state"] isEqualToString:@"1"] || [[responseObject objectForKey:@"state"] isEqualToString:@"2"]) {
            //成功登陆
            self->user = [User yy_modelWithJSON:[responseObject objectForKey:@"user"]];
            //将账户信息保存到本地
            [[JMUserLocalData sharedManager] setIsLogin:true];
            [[JMUserLocalData sharedManager] setUser:self->user];
            [[JMUserLocalData sharedManager] setAuthorization:[responseObject objectForKey:@"token"]];
            [[JMUserLocalData sharedManager] setUserName:self->loginView.userNameTextField.text];
            [[JMUserLocalData sharedManager] setUserPassword:self->loginView.passwordTextField.text];
            
            NSLog(@"%@",self->user);
            NSLog(@"%@",[JMUserLocalData sharedManager].user);
            //弹出消息框
            PCAlertControllerViewController *alertController = [[PCAlertControllerViewController alloc] initWithMessage:@"登录成功"];
            [self presentViewController:alertController animated:true completion:^{
                [self dismissViewControllerAnimated:true completion:nil];
            }];
        } else {
            //登录失败
            PCAlertControllerViewController *alertController = [[PCAlertControllerViewController alloc] initWithMessage:@"账户密码错误"];
            [self presentViewController:alertController animated:true completion:nil];
        }
    } fail:^(NSError *error) {
        //服务器错误，或网络连接失败
        PCAlertControllerViewController *alertController = [[PCAlertControllerViewController alloc] initWithMessage:@"出错了"];
        [self presentViewController:alertController animated:true completion:nil];
    }];
    
}

@end
