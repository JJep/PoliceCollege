//
//  PCPromotionModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/4.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCAnnouncementModel : NSObject
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * hit;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * info;
@property (nonatomic, strong) NSString * isLink;
@property (nonatomic, strong) NSString * published;
@property (nonatomic, strong) NSString * recommended;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger type;
@end
