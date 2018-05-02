//
//  PCNetworkEngine.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "AFHTTPSessionManager.h"
typedef void (^NetworkFailedHandler)(NSError *error);
typedef void (^NetworkSuccessHandler)(id responseObject);
typedef void (^NetworkdownloadProgressHandler)(NSProgress *downloadProgress);
@interface PCNetworkEngine : AFHTTPSessionManager

/**< 网络引擎单例*/
+ (PCNetworkEngine *)sharedEngine;

/**< Get请求*/
- (NSURLSessionDataTask *)getWithAPI:(NSString *)api
                          parameters:(id)parameters
                      succeededBlock:(NetworkSuccessHandler)succeededBlock
                           failBlock:(NetworkFailedHandler)failedBlock;

/**< Post请求*/
- (NSURLSessionDataTask *)postWithAPI:(NSString *)api
                           parameters:(id)parameters
                       succeededBlock:(NetworkSuccessHandler)succeededBlock
                          failedBlock:(NetworkFailedHandler)failedBlock;
// put 请求
- (NSURLSessionDataTask *)putWithAPI:(NSString *)api
                          parameters:(id)parameters
                      succeededBlock:(NetworkSuccessHandler)succeededBlock
                         failedBlock:(NetworkFailedHandler)failedBlock;
/**< del请求*/
- (NSURLSessionDataTask *)delWithAPI:(NSString *)api parameters:(id)parameters succeededBlock:(NetworkSuccessHandler)succeededBlock failedBlock:(NetworkFailedHandler)failedBlock;

/**< download请求*/
- (NSURLSessionDownloadTask *)downloadWithRequest:(NSURLRequest *)request
                                         progress:(NetworkdownloadProgressHandler)downloadBlock
                                   succeededBlock:(NetworkSuccessHandler)succeededBlock
                                      failedBlock:(NetworkFailedHandler)failedBlock;

@end
