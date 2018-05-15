//
//  QuestionTO.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/15.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionTO : NSObject
@property (nonatomic,retain)NSString *answered;
@property (nonatomic,retain)NSString *answerIndex;
@property (nonatomic,assign)CGFloat rscore;
@property (nonatomic,retain)NSString *optionIndex;
@property (nonatomic,assign)NSInteger idField;
@end
