//
//  SearchTableViewCell+ConfigureWithModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchTableViewCell.h"
@class SearchModel;
@interface SearchTableViewCell (ConfigureWithModel)
- (void)configureWithModel:(SearchModel *)model;
@end
