//
//  TestViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/14.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "TestViewModel.h"
#import "QuestionTO.h"
@implementation TestViewModel
- (void)readyToStartActionWithTestID:(NSNumber *)testID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"get";
    request.apiString = @"testpaperStartIsOk";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"id":testID
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

- (void)getQuestionsActionwithTestID:(NSNumber *)testID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"get";
    request.apiString = @"examStart";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"id":testID
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}

- (void)uploadQuestionWithQuestionTO:(QuestionTO *)questionTO testID:(NSNumber *)testID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail
{
    PCBaseRequest *request = [PCBaseRequest new];
    request.requstType = @"post";
    request.apiString = @"addRecord";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                  @"examrecord.id":testID,
                                                                                  @"questionTO.answered":questionTO.answered,
                                                                                  @"questionTO.answerIndex":questionTO.answerIndex,
                                                                                  @"questionTO.id":[NSNumber numberWithInteger:questionTO.idField],
                                                                                  @"questionTO.optionIndex":questionTO.optionIndex
                                                                                  }];
    request.paraDict = dict;
    [request sendRequestSuccess:success error:fail];
}



@end
