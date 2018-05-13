//
//  PersonMoreViewController.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/28.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Situation.h"
@interface PersonMoreViewController : UIViewController
@property(nonatomic,assign) NSUInteger myRanking;
@property(nonatomic,retain) Situation *currentSeasonSituation;
@end
