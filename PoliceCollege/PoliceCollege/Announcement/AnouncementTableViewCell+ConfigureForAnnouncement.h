//
//  Announcementtabelview+ConfigureForAnnouncement.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AnouncementTableViewCell.h"

@class PCAnnouncementModel;

@interface AnouncementTableViewCell (ConfigureForAnnouncement)
- (void)configureForAnnoucement:(PCAnnouncementModel *)announcement;
@end
