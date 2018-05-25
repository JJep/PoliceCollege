//
//  SearchTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchModel;
@interface SearchTableViewCell : UITableViewCell
@property (nonatomic, retain)SearchModel *model;
//- (void)setModel:(SearchModel *)model;
+ (instancetype)initWithModel:(SearchModel *)model ;
@end
