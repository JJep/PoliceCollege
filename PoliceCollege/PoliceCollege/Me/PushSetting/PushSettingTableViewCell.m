//
//  PushSettingTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/24.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PushSettingTableViewCell.h"

@implementation PushSettingTableViewCell {
    UILabel *titleLabel;
    UISwitch *switcher;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        titleLabel = [UILabel new];
        switcher = [UISwitch new];
        [self addSubview:titleLabel];
        [self addSubview:switcher];
        [titleLabel setText:@"title"];
        [switcher setOn:true];
    }
    return self;
}

- (void)layoutSubviews {
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self).offset(15);
        make.bottom.equalTo(self).offset(-15);
        make.right.equalTo(self->switcher.mas_left).offset(-50);
    }];
    
    [switcher mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(8);
        make.bottom.equalTo(self).offset(-8);
        make.width.mas_equalTo(52);
    }];
}

-(void)setTitle:(NSString *)title {
    if (_title != title) {
        _title = title;
        [titleLabel setText:_title];
    }
}

-(void)setIsOn:(BOOL)isOn {
    if (_isOn != isOn) {
        _isOn = isOn;
        [switcher setOn:_isOn];
    }
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
