//
//  PCChannelViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/5.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface PCChannelViewModel : PCViewModel
//make some change-
//获取当前类别中我添加的所有频道
- (void)getMyChannelWithType:(NSNumber *)type success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

//获取当前类别中的所有频道
- (void)getAllChannelsWithType:(NSNumber *)type success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;

- (void)updateChannelWithType:(NSNumber *)type channelID:(NSNumber *)channelID 
@end
