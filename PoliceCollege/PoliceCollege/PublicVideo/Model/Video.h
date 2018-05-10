//
//  VideoModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property (nonatomic, assign) CGFloat ccredit;
@property (nonatomic, assign) NSInteger commentNum;
@property (nonatomic, assign) CGFloat credit;
@property (nonatomic, assign) NSInteger hit;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * published;
@property (nonatomic, strong) NSString * title;

+ (NSDictionary *)modelCustomPropertyMapper ;
@end
