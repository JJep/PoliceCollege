//
//  PCRecommendBookViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/4.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface PCRecommendBookViewModel : PCViewModel
-(void)getRecommendBooksAction:(NSInteger)num success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;
@end
