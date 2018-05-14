//
//  MeTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/21.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "MeTableViewCell.h"
#import "MeTableViewModel.h"
#import "MeItemTableViewCell.h"
#import "MePortraitTableViewCell.h"
@implementation MeTableViewCell

+(instancetype)initWithModel:(MeTableViewModel *)model{
    
    //根据OC函数获取model类名并将其转化为OC字符串
    NSString *modelName = [NSString stringWithUTF8String:object_getClassName(model)];
    
    //使用model的类名拼接一个"cell"来获取到cell类名
    NSString *cellName = [modelName stringByAppendingString:@"TableViewCell"];
    
    
    
    //根据提供的cellName来给予不同cell所对应的'cell子类'初始化一个cell对象返回给我们的父类对象
    
    //唯一标示符可以使我们所提供的model来给与不同cell所对应的标示符来重用
    MeTableViewCell *cell = [[NSClassFromString(cellName) alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:modelName];

    return cell;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
