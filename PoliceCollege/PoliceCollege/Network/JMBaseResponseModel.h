//
//  JMBaseResponseModel.h
//  JMMediaApp
//
//  Created by lixuezhi on 2017/11/13.
//  Copyright © 2017年 JMMedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"
#import "JMResponseProtocol.h"

@interface JMBaseResponseModel : NSObject <YYModel, JMResponseProtocol>

@property (nonatomic, assign) BOOL success;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString * _Nullable msg;
@property (nonatomic, strong) NSError * _Nonnull error;

@end

@interface NSArray (JMBaseResponseModel)
/**
 Creates and returns an array from a json-array.
 This method is thread-safe.
 
 @param cls  The instance's class in array.
 @param json  A json array of `NSArray`, `NSString` or `NSData`.
 Example: [{"name","Mary"},{name:"Joe"}]
 
 @return A array, or nil if an error occurs.
 */
+ (nullable NSArray *)sp_modelArrayWithClass:(Class _Nullable )cls json:(id _Nullable )json;

@end
