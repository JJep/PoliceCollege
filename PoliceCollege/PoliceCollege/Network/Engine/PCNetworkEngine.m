//
//  PCNetworkEngine.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCNetworkEngine.h"
#import "PCResponseSerializer.h"
#import "PCRequestSerializer.h"
@implementation PCNetworkEngine

+ (PCNetworkEngine *)sharedEngine {
    PCNetworkEngine *sharedEngine = [PCNetworkEngine manager];
    sharedEngine.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    sharedEngine.requestSerializer = [[PCRequestSerializer alloc] init];
    sharedEngine.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    sharedEngine.requestSerializer.timeoutInterval = 30.0;
    sharedEngine.responseSerializer = [[PCResponseSerializer alloc] init];
    sharedEngine.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript",@"text/html",@"text/plain",nil];
    return sharedEngine;
}

/**< Get请求*/
- (NSURLSessionDataTask *)getWithAPI:(NSString *)api parameters:(id)parameters
                      succeededBlock:(NetworkSuccessHandler)succeededBlock failBlock:(NetworkFailedHandler)failedBlock {
    NSURLSessionDataTask *task = [self GET:api parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeededBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failedBlock(error);
    }];
    return task;
}

/**< Post请求*/
- (NSURLSessionDataTask *)postWithAPI:(NSString *)api parameters:(id)parameters succeededBlock:(NetworkSuccessHandler)succeededBlock failedBlock:(NetworkFailedHandler)failedBlock {
    NSURLSessionDataTask *task = [self POST:api parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeededBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failedBlock(error);
    }];
    return task;
}

/**< Put请求*/
- (NSURLSessionDataTask *)putWithAPI:(NSString *)api parameters:(id)parameters succeededBlock:(NetworkSuccessHandler)succeededBlock failedBlock:(NetworkFailedHandler)failedBlock {
    return [self PUT:api parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeededBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failedBlock(error);
    }];
}

/**< del请求*/
- (NSURLSessionDataTask *)delWithAPI:(NSString *)api parameters:(id)parameters succeededBlock:(NetworkSuccessHandler)succeededBlock failedBlock:(NetworkFailedHandler)failedBlock {
    return [self DELETE:api parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeededBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failedBlock(error);
    }];
}


/**< download请求*/
- (NSURLSessionDownloadTask *)downloadWithRequest:(NSURLRequest *)request progress:(NetworkdownloadProgressHandler)downloadBlock succeededBlock:(NetworkSuccessHandler)succeededBlock failedBlock:(NetworkFailedHandler)failedBlock {
    NSURLSessionDownloadTask *task = [self downloadTaskWithRequest:request
                                                          progress:^(NSProgress * _Nonnull downloadProgress) {
                                                              downloadBlock(downloadProgress);}
                                                       destination:nil
                                                 completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                                     if (error) {
                                                         failedBlock(error);
                                                     } else {
                                                         succeededBlock(response);
                                                     }
                                                     
                                                 }];
    return task;
}
@end
