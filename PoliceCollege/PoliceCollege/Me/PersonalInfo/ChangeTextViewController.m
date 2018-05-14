//
//  ChangeTextViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/14.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "ChangeTextViewController.h"

@interface ChangeTextViewController () <UITextFieldDelegate>

@end

@implementation ChangeTextViewController {
    UIButton *confirmBtn;
    UITextField *textField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
}


-(void)initViews{
    
    self.title = [NSString stringWithFormat:@"修改%@",self.name];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    textField = [UITextField new];
    confirmBtn = [UIButton new];
    
    textField.delegate = self;
    
    [self.view addSubview:textField];
    [self.view addSubview:confirmBtn];
    
    [textField setPlaceholder:[NSString stringWithFormat:@"输入%@",self.name]];
    [confirmBtn setBackgroundColor:rgb(74, 144, 226)];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(44);
        make.top.equalTo(self.view).offset(30);
    }];
    
    
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(44);
        make.top.equalTo(self->textField.mas_bottom).offset(30);
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
    [textField resignFirstResponder];
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
