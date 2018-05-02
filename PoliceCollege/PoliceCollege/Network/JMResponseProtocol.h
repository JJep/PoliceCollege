//
//  JMResponseProtocol.h
//  JMMediaApp
//
//  Created by lixuezhi on 2017/11/13.
//  Copyright © 2017年 JMMedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@protocol JMResponseProtocol <NSObject>

#pragma mark  json -> model

/**
 Creates and returns a new instance of the receiver from a json.
 This method is thread-safe.
 @return A new instance created from the json, or nil if an error occurs.
 */
+ (nullable instancetype)JM_modelWithJSON:(id _Nullable )json;

#pragma mark   map

/**
 @discussion If the key in JSON/Dictionary does not match to the model's property name,
 implements this method and returns the additional mapper.
 
 Example:
 
 json:
 {
 "n":"Harry Pottery",
 "p": 256,
 "ext" : {
 "desc" : "A book written by J.K.Rowling."
 },
 "ID" : 100010
 }
 
 + (NSDictionary *)modelCustomPropertyMapper {
 return @{@"name"  : @"n",
 @"page"  : @"p",
 @"desc"  : @"ext.desc",
 @"bookID": @[@"id", @"ID", @"book_id"]};
 }
 
 @return A custom mapper for properties.
 */
+ (nullable NSDictionary<NSString *, id> *)JM_modelCustomPropertyMapper;

/**
 The generic class mapper for container properties.
 
 @discussion If the property is a container object, such as NSArray/NSSet/NSDictionary,
 implements this method and returns a property->class mapper, tells which kind of
 object will be add to the array/set/dictionary.
 
 + (NSDictionary *)modelContainerPropertyGenericClass {
 return @{@"shadows" : [YYShadow class],
 @"borders" : YYBorder.class,
 @"attachments" : @"YYAttachment" };
 }
 
 @return A class mapper.
 */
+ (nullable NSDictionary<NSString *, id> *)JM_modelContainerPropertyGenericClass;


#pragma mark  model -> json

/**
 Generate a json object from the receiver's properties.
 */
- (nullable id)JM_modelToJSONObject;
/**
 Generate a json string's data from the receiver's properties.
 */
- (nullable NSData *)JM_modelToJSONData;

#pragma mark   copy / coder

/**
 Copy a instance with the receiver's properties.
 */
- (nullable id)JM_modelCopy;
/**
 Encode the receiver's properties to a coder.
 */
- (void)JM_modelEncodeWithCoder:(NSCoder *_Nullable)aCoder;
/**
 Decode the receiver's properties from a decoder.
 */
- (id _Nullable )JM_modelInitWithCoder:(NSCoder *_Nullable)aDecoder;

#pragma mark  equal

/**
 Compares the receiver with another object for equality, based on properties.
 @return `YES` if the reciever is equal to the object, otherwise `NO`.
 */
- (BOOL)JM_modelIsEqual:(id _Nullable )model;


@end
