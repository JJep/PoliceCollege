//
//  PCAnnouncementViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/7.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface PCAnnouncementViewModel : PCViewModel
- (void)getDetailAnnouncementActionWithID:(NSNumber *)announcementID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;
@end
