//
//  VideoViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface VideoViewModel : PCViewModel
- (void)getFirstRecommendedVideoListAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
- (void)getMoreREcommendedVideoListAction:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;
- (void)getDetailVideoAction:(NSNumber *)courseID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

@end
