//
//  TestViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/29.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "TestViewController.h"
#import "QuestionView.h"
#import "TestBottomView.h"
@interface TestViewController ()

@end

@implementation TestViewController {
    QuestionView *questionView;
    TestBottomView *bottomView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    
    questionView = [QuestionView new];
    bottomView = [TestBottomView new];
    
    [self.view addSubview:questionView];
    [self.view addSubview:bottomView];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    
    [questionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self->bottomView.mas_top).offset(-20);
    }];
}

@end
