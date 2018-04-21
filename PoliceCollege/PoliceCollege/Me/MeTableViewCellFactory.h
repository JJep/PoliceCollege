//
//  MeTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/21.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, PCMeTableViewCellType){
    PCMeTableViewCellTypePortrait,
    PCMeTableViewCellTypeItem,
};
@interface MeTableViewCellFactory : NSObject
+ (UITableViewCell *)tableViewCell:(PCMeTableViewCellType )PCMeTableViewCellType ;
@end
