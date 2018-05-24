//
//  SearchTableViewCell+ConfigureWithModel.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchTableViewCell+ConfigureWithModel.h"
#import "SearchModel.h"
@implementation SearchTableViewCell (ConfigureWithModel)
- (void)configureWithModel:(SearchModel *)model {
    SearchTableViewCell *cell = [SearchTableViewCell initWithModel:model];
    [cell setModel:model];
}


@end
