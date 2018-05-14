//
//  PersonCenterViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface PersonCenterViewModel : PCViewModel
- (void)getRankingAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail;
- (void)getCurrentSeasonCreditInfoAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
- (void)getFourSeasonsCreditActionWithYear:(NSNumber *)year success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
- (void)getLearningOverviewAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
@end
