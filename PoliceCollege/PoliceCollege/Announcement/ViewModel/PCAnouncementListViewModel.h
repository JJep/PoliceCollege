//
//  PCPromotionListViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/4.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface PCAnouncementListViewModel : PCViewModel

//获取第一批通知列表
- (void)getFirstPromotionListAction:(PCSuccessHandler)success fail:(PCFailedHandler)fail ;

//获取当前页面的通知列表
- (void)getPromotionListActionWithCurrentPage:(NSNumber *)currentPage success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

- (void)getDetailAnnouncementActionWithID:(NSNumber *)announcementID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

@end
