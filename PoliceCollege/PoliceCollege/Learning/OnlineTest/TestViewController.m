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
#import "PCCurrentDate.h"
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
    NSMutableArray *selectedOptionsArray;
    NSArray *optionsArray;
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
    selectedOptionsArray = [NSMutableArray new];
    [testViewModel getQuestionsActionwithTestID:[NSNumber numberWithInteger:self.testID] success:^(id responseObject) {
        self->questionArray = [NSArray yy_modelArrayWithClass:[Question class] json:[responseObject objectForKey:@"questionList"]];
        NSLog(@"%@",self->questionArray);
        self->currentIndex = 0;
        [self updateUI];
    } fail:^(NSError *error) {
        
    }];
}

- (void)uploadAnswer:(Question *)question {
    //处理接口中的参数
    QuestionTO *questionTO = [QuestionTO new];
    PCCurrentDate *currentDate = [PCCurrentDate new];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init ];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString * currentDateString = [dateFormatter stringFromDate:currentDate];
    questionTO.time = currentDateString;//回答问题的时间
    questionTO.idField = question.idField;//问题的id
    questionTO.answerIndex = question.answer;//问题的正确答案
    questionTO.score = question.score;//问题dadui
    __block NSString *answered = [[NSString alloc] init];
    [selectedOptionsArray enumerateObjectsUsingBlock:^(NSNumber *optionIndex, NSUInteger idx, BOOL * _Nonnull stop) {
//        [answered stringByAppendingString:[NSString stringWithFormat:@"%@,", optionIndex]];
        answered = [answered stringByAppendingString:[NSString stringWithFormat:@"%@,",optionIndex]];
        if (idx == self->selectedOptionsArray.count-1) {
            answered = [answered substringWithRange:NSMakeRange(0, answered.length-1)];
        }
    }];
    questionTO.answered = answered; //用户选择的答案
    
    __block NSString *optionIndexString = [NSString new];
    [optionsArray enumerateObjectsUsingBlock:^(NSNumber *optionIndex, NSUInteger idx, BOOL * _Nonnull stop) {
        optionIndexString = [optionIndexString stringByAppendingString:[NSString stringWithFormat:@"%@,", optionIndex]];
        if (idx == self->optionsArray.count-1) {
            optionIndexString = [optionIndexString substringWithRange:NSMakeRange(0, optionIndexString.length-1)];
        }
    }];
    questionTO.optionIndex = optionIndexString;//用户看到的题目顺序
    if ([self selectedOptionIsEqualToAnswer:question]) {//判断用户回答是否正确
        questionTO.rscore = question.score;//回答正确
    } else {
        questionTO.rscore = 0; //回答错误
    }

    currentScore += questionTO.rscore;
    //回到到最后一道题目时，发送请求
    if (self->currentIndex == self->questionArray.count) {
        [testViewModel uploadQuestionWithQuestionTO:questionTO testID:[NSNumber numberWithInteger:self.testID] success:^(id responseObject) {
            //判断所有问题是否已经回答完毕
            if (self->currentIndex == self->questionArray.count) {
                
            } else {
                
            }
        } fail:^(NSError *error) {

        }];
    }
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
    [selectedOptionsArray removeAllObjects];
    
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
    
    optionsArray = [NSArray arrayWithArray:[self unRepeatRandomNumber:optionArray.count number:optionArray.count]];
    
    for (int i = 0; i < optionArray.count; i++) {
        OptionView *optionView = [OptionView new];
        [self.view addSubview:optionView];
        NSInteger index = ((NSNumber *)optionsArray[i]).integerValue;
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
        [selectedOptionsArray addObject:[NSNumber numberWithInteger:button.index-1]];
    } else {
        [selectedOptionsArray removeObject:[NSNumber numberWithInteger:button.index-1]];
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

- (BOOL)selectedOptionIsEqualToAnswer:(Question *)question {
    
    NSArray *selectedResultArray = [selectedOptionsArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];

    
    NSArray *answerArray = [question.answer componentsSeparatedByString:@","];
    
    NSArray *answerResultArray = [answerArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    return [selectedResultArray isEqualToArray:answerResultArray];
}


- (void)complete {
    [self uploadAnswer:(Question *)questionArray[currentIndex-1]];
    
    [self.navigationController popViewControllerAnimated:true];
}

@end
