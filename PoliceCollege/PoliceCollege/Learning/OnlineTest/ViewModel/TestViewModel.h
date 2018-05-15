//
//  TestViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/14.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"
@class QuestionTO;
@interface TestViewModel : PCViewModel
- (void)readyToStartActionWithTestID:(NSNumber *)testID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

- (void)getQuestionsActionwithTestID:(NSNumber *)testID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

- (void)uploadQuestionWithQuestionTO:(QuestionTO *)questionTO testID:(NSNumber *)testID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
@end
