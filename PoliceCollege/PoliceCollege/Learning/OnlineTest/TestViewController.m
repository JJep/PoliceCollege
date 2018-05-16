//
//  TestViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/29.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "TestViewController.h"
#import "TestBottomView.h"
#import "TestViewModel.h"
#import "Question.h"
#import "QuestionTO.h"
#import "OptionButton.h"
#import "OptionView.h"
@interface TestViewController ()

@end

@implementation TestViewController {
    TestBottomView *bottomView;
    TestViewModel *testViewModel;
    NSArray *questionArray;
    NSInteger currentIndex;
    UILabel *questionNameLabel;
    UILabel *topLabel ;
    NSInteger currentScore;
    NSMutableArray *optionsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
    [self initData];
}

- (void)initData {
    currentScore = 0;
    testViewModel = [TestViewModel new];
    optionsArray = [NSMutableArray new];
    [testViewModel getQuestionsActionwithTestID:[NSNumber numberWithInteger:self.testID] success:^(id responseObject) {
        self->questionArray = [NSArray yy_modelArrayWithClass:[Question class] json:[responseObject objectForKey:@"questionList"]];
        NSLog(@"%@",self->questionArray);
        self->currentIndex = 0;
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
}

- (void)uploadAnswer:(Question *)question {
    QuestionTO *questionTO = [QuestionTO new];
    questionTO.idField = question.idField;
    questionTO.answerIndex = question.answer;
//    NSMutableString *answerString = [[NSMutableString alloc] initWithString:@""];
//    for (__strong UIView *subView in self.view.subviews) {
//        int index = 1;
//        if ([[subView class] isEqual:[OptionView class]]) {
//            OptionButton *button = (OptionButton *)subView;
//            if (button.selected) {
//                [answerString appendString:[NSString stringWithFormat:@"%d,", index]];
//            }
//            index++;
//        }
//    }
    NSString *answered = [[NSString alloc] init];
    [optionsArray enumerateObjectsUsingBlock:^(NSNumber *optionIndex, NSUInteger idx, BOOL * _Nonnull stop) {
        [answered stringByAppendingString:[NSString stringWithFormat:@"%@,", optionIndex]];
        if (idx == self->optionsArray.count-1) {
            [answered substringWithRange:NSMakeRange(0, self->optionsArray.count-1)];
        }
    }];
    questionTO.answered = answered;
    questionTO.optionIndex = question.optionIndex;

    [testViewModel uploadQuestionWithQuestionTO:questionTO testID:[NSNumber numberWithInteger:self.testID] success:^(id responseObject) {

    } fail:^(NSError *error) {

    }];
}

- (NSArray *)unRepeatRandomNumber:(NSInteger)count number:(NSInteger)number {
    if (count < number) {
        return nil;
    }
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[]];
    for (int i = 1; i < count+1; i++) {
        [array addObject:[NSNumber numberWithInt:i]];
    }
    NSArray *randomArray = [NSArray arrayWithArray:[array sortedArrayUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
        int seed = arc4random_uniform(2);
        if (seed) {
            return [str1 compare:str2];
        } else {
            return [str2 compare:str1];
        }
    }]];
    return randomArray;
}


- (void)updateUI {
    
    //清理上一题所记录的内容
    [optionsArray removeAllObjects];
    
    Question *question = [Question new];
    question = questionArray[currentIndex];
    [questionNameLabel setText:question.stem];
    [topLabel setText:[NSString stringWithFormat:@"%lu/%lu",currentIndex+1,questionArray.count]];
    CGFloat optionViewHeight = 30;
    NSArray *optionArray = [NSArray arrayWithArray:[question.options componentsSeparatedByString:@" "]];
    
    for (UIView *subview in self.view.subviews) {
        if ([[subview class] isEqual:[OptionView class]]) {
            [subview removeFromSuperview];
        }
    }
    
    NSArray *ary = [NSArray arrayWithArray:[self unRepeatRandomNumber:optionArray.count number:optionArray.count]];
    
    for (int i = 0; i < optionArray.count; i++) {
        OptionView *optionView = [OptionView new];
        [self.view addSubview:optionView];
        NSInteger index = ((NSNumber *)ary[i]).integerValue;
        [optionView.optionLabel setText:optionArray[index-1]];
        optionView.optionButton.index = index;
        [optionView.optionButton addTarget:self action:@selector(didTouchOptionButton:) forControlEvents:UIControlEventTouchUpInside];
        [optionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self->questionNameLabel.mas_bottom).offset((15 + optionViewHeight) * i + 15);
            make.height.mas_equalTo(30);
        }];
    }
}

- (void)initViews {
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    
    questionNameLabel = [UILabel new];
    topLabel = [UILabel new];
    
    [questionNameLabel setText:@"用户是否能接受路边的问答"];
    [questionNameLabel setNumberOfLines:0];
    [topLabel setText:@"1/3"];
    [topLabel setBackgroundColor:rgb(74, 144, 226)];
    [topLabel setTextColor:[UIColor whiteColor]];
    [topLabel setTextAlignment:NSTextAlignmentCenter];
    

    bottomView = [TestBottomView new];
    
    [self.view addSubview:questionNameLabel];
    [self.view addSubview:topLabel];
    [self.view addSubview:bottomView];
    
    
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view).offset(15);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(30);
    }];
    
    [questionNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self->topLabel.mas_bottom).offset(20);
        make.right.equalTo(self.view);
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    
    [bottomView.nextButton addTarget:self action:@selector(nextQuestion) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didTouchOptionButton:(OptionButton *)button {
    //对用户点击每个选项进行操作，将选中的选项保存或将不选的选项清除
    if (button.choosed) {
        [optionsArray addObject:[NSNumber numberWithInteger:button.index]];
    } else {
        [optionsArray removeObject:[NSNumber numberWithInteger:button.index]];
    }
}

- (void)nextQuestion {
    if (currentIndex++ == questionArray.count-1) {
        [bottomView.nextButton setTitle:@"完成" forState:UIControlStateNormal];
        [bottomView.nextButton removeTarget:self action:@selector(nextButton) forControlEvents:UIControlEventTouchUpInside];
        [bottomView.nextButton addTarget:self action:@selector(complete) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [self uploadAnswer:(Question *)questionArray[currentIndex-1]];
        [self updateUI];
    }
}

- (void)complete {
    [self uploadAnswer:(Question *)questionArray[currentIndex-1]];
    
    [self.navigationController popViewControllerAnimated:true];
}

@end
