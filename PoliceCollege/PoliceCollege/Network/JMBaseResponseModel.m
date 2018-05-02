//
//  JMBaseResponseModel.m
//  JMMediaApp
//
//  Created by lixuezhi on 2017/11/13.
//  Copyright © 2017年 JMMedia. All rights reserved.
//

#import "JMBaseResponseModel.h"

@implementation JMBaseResponseModel

+ (nullable instancetype)JM_modelWithJSON:(id _Nullable )json {
    return [self yy_modelWithJSON:json];
}

#pragma mark -- map

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return [self JM_modelCustomPropertyMapper];
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return [self JM_modelContainerPropertyGenericClass];
}

+ (nullable NSDictionary<NSString *, id> *)JM_modelCustomPropertyMapper {
    return [NSDictionary new];
}

+ (nullable NSDictionary<NSString *, id> *)JM_modelContainerPropertyGenericClass {
    return [NSDictionary new];
}

#pragma mark  model -> json

- (nullable id)JM_modelToJSONObject {
    return [self yy_modelToJSONObject];
}

- (nullable NSData *)JM_modelToJSONData {
    return [self yy_modelToJSONData];
}

#pragma mark   copy / coder
- (nullable id)JM_modelCopy {
    return [self yy_modelCopy];
}

- (void)JM_modelEncodeWithCoder:(NSCoder *_Nullable)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (id _Nullable )JM_modelInitWithCoder:(NSCoder *_Nullable)aDecoder {
    return [self yy_modelInitWithCoder:aDecoder];
}

#pragma mark  equal
- (BOOL)JM_modelIsEqual:(id _Nullable )model {
    return [self yy_modelIsEqual:model];
}


@end

@implementation NSArray (JMBaseResponseModel)

+ (nullable NSArray *)sp_modelArrayWithClass:(Class)cls json:(id)json {
    return [self yy_modelArrayWithClass:cls json:json];
}

@end

