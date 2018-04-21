//
//  PCPromotionView.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PCBannerView;
@class PCCenterdView;
@class PCHotIssueView;
@interface PCPromotionView : UIView
@property (nonatomic,retain)PCBannerView *bannerView;
@property (nonatomic,retain)PCCenterdView *centerView;
@property (nonatomic,retain)PCHotIssueView *hotIssueView;
@end
