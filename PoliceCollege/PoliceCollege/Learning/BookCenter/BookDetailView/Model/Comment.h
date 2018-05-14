//
//  Comment.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/14.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject
@property (nonatomic, strong) NSString * content;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * imgComment;
@property (nonatomic, strong) NSString * nameComment;
@property (nonatomic, strong) NSString * published;
@end
