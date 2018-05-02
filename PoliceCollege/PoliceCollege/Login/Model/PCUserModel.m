//
//  PCUserModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

/*
 "birthday": "生日","headimg": "头像","hobby": "爱好","hometown": "家乡","id": 0,"livingplace": "现居地","nativeDialect": "一句家乡话","nickname": "昵称","phone": "611224","pos": "职务或职级","sex": "male,性别"
 */
#import "PCUserModel.h"

@interface PCUserModel() <NSCoding>
@end

@implementation PCUserModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userid":@"id"};
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self) {
        self.userID = [[aDecoder decodeObjectForKey:@"id"] integerValue];
        self.birthday = [[aDecoder decodeObjectForKey:@"birthday"] floatValue];
        self.headimg = [aDecoder decodeObjectForKey:@"headimg"];
        self.hobby = [aDecoder decodeObjectForKey:@"hobby"];
        self.hometown = [aDecoder decodeObjectForKey:@"hometown"];
        self.livingplace = [aDecoder decodeObjectForKey:@"livingplace"];
        self.nativeDialect = [aDecoder decodeObjectForKey:@"nativeDialect"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"] ;
        self.phone = [aDecoder decodeObjectForKey:@"phone"] ;
        self.pos = [aDecoder decodeObjectForKey:@"pos"] ;
        self.sex = [[aDecoder decodeObjectForKey:@"sex"] integerValue];

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.userID forKey:@"id"];
    [aCoder encodeFloat:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.headimg forKey:@"headimg"];
    [aCoder encodeObject:self.hobby forKey:@"hobby"];
    [aCoder encodeObject:self.hometown forKey:@"hometown"];
    [aCoder encodeObject:self.livingplace forKey:@"livingplace"];
    [aCoder encodeObject:self.nativeDialect forKey:@"nativeDialect"];
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.pos forKey:@"pos"];
    [aCoder encodeInteger:self.sex forKey:@"sex"];
    
}
@end
