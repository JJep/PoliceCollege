//
//  MeTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/21.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MeTableViewModel;
@interface MeTableViewCell : UITableViewCell
//在父类中声明出一个model类对象，在它的子类中重写set方法，在set方法内部去实现赋值操作
@property(nonatomic,strong) MeTableViewModel *model;

//根据不同类型的model创建不同的cell
+(instancetype)initWithModel:(MeTableViewModel *)model;

@end
