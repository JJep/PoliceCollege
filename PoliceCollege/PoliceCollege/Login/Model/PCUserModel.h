//
//  PCUserModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

/*
 "birthday": "生日",
 "headimg": "头像",
 "hobby": "爱好",
 "hometown": "家乡",
 "id": 0,
 "livingplace": "现居地",
 "nativeDialect": "一句家乡话",
 "nickname": "昵称",
 "phone": "611224",
 "pos": "职务或职级",
 "sex": "male,性别"
 */
typedef enum : NSUInteger {
    JMNoSex,
    JMMan,
    JMWomam,
} JMSex;

#import <Foundation/Foundation.h>

@interface PCUserModel : NSObject
@property (nonatomic,assign)NSInteger userID;
@property (nonatomic,assign)NSTimeInterval birthday;
@property (nonatomic,retain)NSString *headimg;
@property (nonatomic,retain)NSString *hobby;
@property (nonatomic,retain)NSString *hometown;
@property (nonatomic,retain)NSString *livingplace;
@property (nonatomic,retain)NSString *nativeDialect;
@property (nonatomic,retain)NSString *nickname;
@property (nonatomic,retain)NSString *phone;
@property (nonatomic,retain)NSString *pos;
@property (nonatomic,assign)JMSex sex;
@end
