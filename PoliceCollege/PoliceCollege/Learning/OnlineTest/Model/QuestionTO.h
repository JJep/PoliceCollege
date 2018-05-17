//
//  QuestionTO.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/15.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>
//{"time":"20171226130716","score":2.0,"answer":"1","qid":18032,"rscore":2.0,"option":"1,4,2,3","answered":"1"}
@interface QuestionTO : NSObject
@property (nonatomic,retain)NSString *time;
@property (nonatomic,assign)CGFloat score;
@property (nonatomic,retain)NSString *answered;
@property (nonatomic,retain)NSString *answerIndex;
@property (nonatomic,assign)CGFloat rscore;
@property (nonatomic,retain)NSString *optionIndex;
@property (nonatomic,assign)NSInteger idField;
@end
