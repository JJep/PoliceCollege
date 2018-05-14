//
//  SeasonSubview.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/1.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SeasonSubview.h"

@implementation SeasonSubview {
    UILabel *compusoryCreditTitleLabel;
    UILabel *commentCreditTitleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _compusoryCreditLabel = [UILabel new];
        _commentCreditLabel = [UILabel new];
        compusoryCreditTitleLabel = [UILabel new];
        commentCreditTitleLabel = [UILabel new];
    
        [self addSubview:compusoryCreditTitleLabel];
        [self addSubview:_compusoryCreditLabel];
        [self addSubview:commentCreditTitleLabel];
        [self addSubview:_commentCreditLabel];
        
        [compusoryCreditTitleLabel setText:@"季度必须学分"];
        compusoryCreditTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        compusoryCreditTitleLabel.textColor = [UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1/1.0];
        
        [commentCreditTitleLabel setText:@"季度必须学分"];
        commentCreditTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        commentCreditTitleLabel.textColor = [UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1/1.0];
        
        [_compusoryCreditLabel setText:@"150"];
        _compusoryCreditLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        _compusoryCreditLabel.textColor = [UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1/1.0];
        [_compusoryCreditLabel setTextAlignment:NSTextAlignmentRight];
        
        [_commentCreditLabel setText:@"150"];
        _commentCreditLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        _commentCreditLabel.textColor = [UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1/1.0];
        [_commentCreditLabel setTextAlignment:NSTextAlignmentRight];
        
        [self layoutViews];
    }
        return self;
}


- (void)layoutViews {
    [compusoryCreditTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self).offset(-200);
        make.top.equalTo(self).offset(20);
        make.height.mas_equalTo(22);
    }];
    
    [commentCreditTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->compusoryCreditTitleLabel.mas_bottom).offset(6);
        make.height.mas_equalTo(22);
        make.left.equalTo(self->compusoryCreditTitleLabel);
        make.right.equalTo(self->compusoryCreditTitleLabel);
    }];
    
    [_compusoryCreditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.right.equalTo(self).offset(-33);
        make.top.bottom.equalTo(self->compusoryCreditTitleLabel);
    }];
    
    [_commentCreditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.right.equalTo(self->_compusoryCreditLabel);
        make.top.bottom.equalTo(self->commentCreditTitleLabel);
    }];
}
@end
