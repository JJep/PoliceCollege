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
#import "TestViewModel.h"
#import "Question.h"
#import "QuestionTO.h"
#import "OptionButton.h"
@interface TestViewController ()

@end

@implementation TestViewController {
    QuestionView *questionView;
    TestBottomView *bottomView;
    TestViewModel *testViewModel;
    NSArray *questionArray;
    NSInteger currentIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
    [self initData];
}

- (void)initData {
    testViewModel = [TestViewModel new];
    [testViewModel getQuestionsActionwithTestID:[NSNumber numberWithInteger:self.testID] success:^(id responseObject) {
        self->questionArray = [NSArray yy_modelArrayWithClass:[Question class] json:[responseObject objectForKey:@"questionList"]];
        NSLog(@"%@",self->questionArray);
        self->currentIndex = 0;
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
}

- (void)uploadAnswer {
//    QuestionTO *questionTO = [QuestionTO new];
//    questionTO.idField = ((Question *)questionArray[currentIndex-1]).idField;
//
//    NSMutableString *optionIndexString = [[NSMutableString alloc] initWithString:@""];
//    for (__strong UIView *subView in self.view.subviews) {
//        int index = 1;
//        if ([[subView class] isEqual:[OptionButton class]]) {
//
//            OptionButton *button = (OptionButton *)subView;
//            if (button.selected) {
//                [optionIndexString appendString:[NSString stringWithFormat:@"%d,", index]];
//            }
//            index++;
//        }
//    }
//    questionTO.optionIndex = optionIndexString;
//
//    [testViewModel uploadQuestionWithQuestionTO:questionTO testID:[NSNumber numberWithInteger:self.testID] success:^(id responseObject) {
//
//    } fail:^(NSError *error) {
//
//    }];
}

- (void)updateUI {
    [questionView setModel:questionArray[currentIndex] ];
    [questionView.topLabel setText:[NSString stringWithFormat:@"%lu/%lu",currentIndex+1,questionArray.count]];
}

- (void)initViews {
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
    
    [bottomView.nextButton addTarget:self action:@selector(nextQuestion) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextQuestion {
    if (currentIndex++ == questionArray.count-1) {
        [bottomView.nextButton setTitle:@"完成" forState:UIControlStateNormal];
        [bottomView.nextButton removeTarget:self action:@selector(nextButton) forControlEvents:UIControlEventTouchUpInside];
        [bottomView.nextButton addTarget:self action:@selector(complete) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [self uploadAnswer];
        [self updateUI];
    }
}

- (void)complete {
    
}

@end
