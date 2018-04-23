//
//  MeTableViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/21.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, PCMeTableViewModelType){
    PCMeTableViewModelTypePortrait,
    PCMeTableViewModelTypeItem,
};
@interface MeTableViewModel : NSObject
+(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
