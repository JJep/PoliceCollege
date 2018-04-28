//
//  YearPickerView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/28.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "YearPickerView.h"
@interface YearPickerView()
@end
@implementation YearPickerView {
    UILabel *yearTitleLabel;

}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        yearTitleLabel = [UILabel new];
        _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _pickerView = [[UIPickerView alloc] init];
        
        yearTitleLabel.text = @"请选择";
        yearTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        yearTitleLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1/1.0];
        [yearTitleLabel setTextAlignment:NSTextAlignmentCenter];
        
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton.titleLabel setFont:[UIFont fontWithName:@"PingFang-SC-Regular" size:13]];
        [_cancelButton setTitleColor:rgb(158, 158, 158) forState:UIControlStateNormal];
        
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmButton.titleLabel setFont:[UIFont fontWithName:@"PingFang-SC-Regular" size:13]];
        [_confirmButton setTitleColor:rgba(74,144,226,1) forState:UIControlStateNormal];
        
        
        [self addSubview:yearTitleLabel];
        [self addSubview:_cancelButton];
        [self addSubview:_confirmButton];
        [self addSubview:_pickerView];
        
        [self layoutViews];
        
    }
    return self;
    
}

- (void)layoutViews {
    [yearTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.centerX.equalTo(self);
        make.top.equalTo(self).offset(10);
        make.height.mas_equalTo(22);
    }];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.centerY.equalTo(self->yearTitleLabel);
    }];
    
    [_confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.centerY.equalTo(self->yearTitleLabel);
    }];
    
    [_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->yearTitleLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-10);
    }];
}




@end
