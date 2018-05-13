//
//  Book.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/4.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, strong) NSString * author;
@property (nonatomic, strong) NSString * ccredit;
@property (nonatomic, strong) NSString * commentNum;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * credit;
@property (nonatomic, strong) NSString * hit;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * label;
@property (nonatomic, strong) NSString * published;
@property (nonatomic, strong) NSObject * recommendNum;
@property (nonatomic, assign) NSInteger recommended;
@property (nonatomic, strong) NSObject * sectionNum;
@property (nonatomic, strong) NSObject * sections;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSObject * typeName;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSObject * userName;

@end
