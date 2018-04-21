//
//  MeTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/21.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MeTableViewCellFactory.h"
#import "MePortraitTableViewCell.h"
#import "MeItemTableViewCell.h"
@implementation MeTableViewCellFactory

+ (UITableViewCell *)tableViewCell:(PCMeTableViewCellType )PCMeTableViewCellType {
    UITableViewCell *cell ;
    switch (PCMeTableViewCellType) {
        case PCMeTableViewCellTypePortrait:
            cell = [[MePortraitTableViewCell alloc] init];
            break;
        case PCMeTableViewCellTypeItem:
            cell = [[MeItemTableViewCell alloc] init];
            break;
        default:
            break;
    }
    return cell;
}


@end
