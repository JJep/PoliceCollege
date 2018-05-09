//
//  PCBaseRequest.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCBaseRequest.h"
#import "JMBaseResponseModel.h"
#import "JMUserLocalData.h"
#import "PCLoginViewModel.h"
@interface PCBaseRequest()
@property (nonatomic, strong) NSURLSessionTask *task;
@property (nonatomic, strong) NSString *baseUrl;
@end
@implementation PCBaseRequest

- (instancetype)init {
    self = [super init];
    if(self) {
#if DEBUG
        self.baseUrl = @"http://139.224.208.224/NetworkCollege-app";
//        self.baseUrl = @"http://192.168.0.108/NetworkCollege-app";
#else
        self.baseUrl = @"http://139.224.208.224/NetworkCollege-app";
//        self.baseUrl = @"http://192.168.0.108/NetworkCollege-app";
#endif
    }
    return self;
}

+ (PCBaseRequest *)request
{
    PCBaseRequest *request = [[PCBaseRequest alloc] init];
    request.requstType = @"get";
    return request;
}

- (void)setPageNum:(NSInteger)pageNum {
    _pageNum = pageNum;
    self.paraDict[@"pageNum"] = @(pageNum);
}

- (void)setPageSize:(NSInteger)pageSize {
    _pageSize = pageSize;
    self.paraDict[@"pageSize"] = @(pageSize);
}

- (void)setBodyData:(NSString *)bodyData
{
    _bodyData = bodyData;
}

- (NSString *)requstType {
    if (_requstType == nil) {
        return @"get";
    }
    return _requstType;
}

- (void)sendRequestSuccess:(NetworkSuccessHandler)successBlock error:(NetworkFailedHandler)errorBlock {
    //确认最终的url为actual url
    NSString *actualUrl = [self.apiString hasPrefix:@"http://"] ? self.apiString : [NSString stringWithFormat:@"%@/%@", self.baseUrl, self.apiString];
    
    if ([self.requstType isEqualToString:@"get"]) {
        self.task = [[PCNetworkEngine sharedEngine] getWithAPI:actualUrl parameters:self.paraDict succeededBlock:^(id responseObject) {
            id jsonS = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            if ([[jsonS objectForKey:@"state"] isEqualToString:@"toLogin"]) {
                //登录过期
                NSLog(@"提醒用户重新登录");
                [JMUserLocalData removeAllLocalData];
            } else {
                successBlock(jsonS);
            }
        } failBlock:^(NSError *error) {
            errorBlock(error);
        }];
    } else if ([self.requstType isEqualToString:@"post"]) {
        self.task = [[PCNetworkEngine sharedEngine] postWithAPI:actualUrl parameters:self.paraDict succeededBlock:^(id responseObject) {
            //登录过期
            
            id jsonS = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            if ([[jsonS objectForKey:@"state"] isEqualToString:@"toLogin"]) {
                //登录过期
                NSLog(@"提醒用户重新登录");
                [JMUserLocalData removeAllLocalData];
            } else {
                successBlock(jsonS);
            }
        } failedBlock:^(NSError *error) {
            errorBlock(error);
        }];
    } else if ([self.requstType isEqualToString:@"put"]) {
        self.task = [[PCNetworkEngine sharedEngine] putWithAPI:actualUrl parameters:self.paraDict succeededBlock:^(id responseObject) {

            id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            if (self.modelName.length == 0) {
                successBlock(json);
                return ;
            }
            Class<JMResponseProtocol> class = NSClassFromString(self.modelName);
            if ([json isKindOfClass:[NSArray class]]) {
                NSArray *modelArray = [NSArray sp_modelArrayWithClass:class json:json];
                successBlock(modelArray);
            } else {
                id<JMResponseProtocol> model = [class JM_modelWithJSON:json];
                successBlock(model);
            }
        } failedBlock:^(NSError *error) {
            errorBlock(error);
        }];
    } else if ([self.requstType isEqualToString:@"del"]) {
        self.task = [[PCNetworkEngine sharedEngine] delWithAPI:actualUrl parameters:self.paraDict succeededBlock:^(id responseObject) {

            id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            if (self.modelName.length == 0) {
                successBlock(json);
                return ;
            }
            Class<JMResponseProtocol> class = NSClassFromString(self.modelName);
            if ([json isKindOfClass:[NSArray class]]) {
                NSArray *modelArray = [NSArray sp_modelArrayWithClass:class json:json];
                successBlock(modelArray);
            } else {
                id<JMResponseProtocol> model = [class JM_modelWithJSON:json];
                successBlock(model);
            }
        } failedBlock:^(NSError *error) {
            errorBlock(error);
        }];
    }
    
}

- (void)downloadProgress:(NetworkdownloadProgressHandler)downloadBlock
          succeededBlock:(NetworkSuccessHandler)succeededBlock
             failedBlock:(NetworkFailedHandler)failedBlock {
    NSString *actualUrl = [self.apiString hasPrefix:@"http://"] ? self.apiString : [NSString stringWithFormat:@"%@/%@", self.baseUrl, self.apiString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:actualUrl]];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    request.timeoutInterval = 20.0;
    self.task = [[PCNetworkEngine sharedEngine] downloadWithRequest:request progress:^(NSProgress *downloadProgress) {
        downloadBlock(downloadProgress);
    } succeededBlock:^(id responseObject) {
        succeededBlock(responseObject);
    } failedBlock:^(NSError *error) {
        failedBlock(error);
    }];
}
- (void)cancleRequest {
    if (self.task) {
        [self.task cancel];
        self.task = nil;
    }
}

#pragma mark --  lazy  --

- (NSMutableDictionary *)paraDict {
    if (!_paraDict) {
        _paraDict = [[NSMutableDictionary alloc] init];
    }
    return _paraDict;
}
@end
