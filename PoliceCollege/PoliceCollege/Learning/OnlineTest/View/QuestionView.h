//
//  QuestionView.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/29.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestBottomView.h"

@interface QuestionView : UIView
@property (nonatomic,copy)NSString *questionName;
@property (nonatomic,retain)NSArray *questionContentArray;
- (void)loadNextQuestion;

@end
