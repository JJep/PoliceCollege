//
//  PCPromotionDetailViewController.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCAnnouncementModel.h"
@interface PCAnnouncementDetailViewController : UIViewController
@property (nonatomic,assign)NSInteger announcementID;
@property (nonatomic,retain)PCAnnouncementModel *model;
@end
