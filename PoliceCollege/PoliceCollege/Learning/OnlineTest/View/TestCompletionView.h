//
//  TestCompletionView.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCompletionView : UIView
@property (nonatomic, retain)UIButton *completeButton;
- (instancetype)initWithCurrentScore:(NSInteger)currentScore totalScore:(NSInteger)totalScore;
@end
