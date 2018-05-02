//
//  PCBaseRequest.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCNetworkEngine.h"
@interface PCBaseRequest : NSObject
///参数dict
@property (nonatomic, strong) NSMutableDictionary *paraDict;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, assign) NSInteger pageSize;
///get post 默认get
@property (nonatomic, strong) NSString *requstType;
@property (nonatomic, strong) NSString *modelName;
@property (nonatomic, strong) NSString *apiString;

@property (nonatomic, strong) NSString *bodyData;

+ (PCBaseRequest *)request;

/**
 post get请求
 */
- (void)sendRequestSuccess:(NetworkSuccessHandler)successBlock error:(NetworkFailedHandler)errorBlock;

/**
 下载请求
 */
- (void)downloadProgress:(NetworkdownloadProgressHandler)downloadBlock
          succeededBlock:(NetworkSuccessHandler)succeededBlock
             failedBlock:(NetworkFailedHandler)failedBlock;

/**
 取消请求
 */
- (void)cancleRequest;

@end
