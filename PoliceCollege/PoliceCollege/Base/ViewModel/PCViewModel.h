//
//  PCViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCBaseRequest.h"
typedef void (^PCFailedHandler)(NSError *error);
typedef void (^PCSuccessHandler)(id responseObject);

@interface PCViewModel : NSObject

@end
