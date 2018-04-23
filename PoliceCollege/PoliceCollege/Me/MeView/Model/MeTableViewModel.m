//
//  MeTableViewModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/21.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MeTableViewModel.h"
#import "MePortrait.h"
#import "MeItem.h"
@implementation MeTableViewModel
+ (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    //先使用父类创建对象；
    MeTableViewModel *rootModel = nil;
    
    //根据字典中的key对应的数据初始化不同的子类对象并将其返回给父类
    if ([dictionary[@"tag"] isEqualToString:@"portrait"]) {
        rootModel = [[MePortrait alloc]init];
        
    }else if ([dictionary[@"tag"] isEqualToString:@"item"]){
        rootModel = [[MeItem alloc]init];
        
    }
    //使用KVC，使用dictionary的key作为对象的属性，value作为属性值给rootmodel赋值
    [rootModel setValuesForKeysWithDictionary:dictionary];
    return rootModel;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
}

@end
