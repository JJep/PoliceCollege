//
//  Announcementtabelview+ConfigureForAnnouncement.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "AnouncementTableViewCell+ConfigureForAnnouncement.h"
#import "PCAnnouncementModel.h"
@implementation AnouncementTableViewCell (ConfigureForAnnouncement)
- (void)configureForAnnoucement:(PCAnnouncementModel *)announcement
{

    [self setModel:announcement];
    
}
@end
