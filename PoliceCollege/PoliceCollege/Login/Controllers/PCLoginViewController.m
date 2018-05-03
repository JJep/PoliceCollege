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
            
            NSLog(@"%@", self->user);
        }
    } fail:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

@end
