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
@interface PCLoginViewController ()
@end

@implementation PCLoginViewController {
    PCLoginView *loginView;
    PCLoginViewModel *viewModel;
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
    } fail:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
