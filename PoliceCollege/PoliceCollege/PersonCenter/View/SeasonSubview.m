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
    UILabel *compusoryCreditLabel;
    UILabel *commentCreditLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        compusoryCreditLabel = [UILabel new];
        commentCreditLabel = [UILabel new];
        compusoryCreditTitleLabel = [UILabel new];
        commentCreditTitleLabel = [UILabel new];
    
        [self addSubview:compusoryCreditTitleLabel];
        [self addSubview:compusoryCreditLabel];
        [self addSubview:commentCreditTitleLabel];
        [self addSubview:commentCreditLabel];
        
        [compusoryCreditTitleLabel setText:@"季度必须学分"];
        compusoryCreditTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        compusoryCreditTitleLabel.textColor = [UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1/1.0];
        
        [commentCreditTitleLabel setText:@"季度必须学分"];
        commentCreditTitleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        commentCreditTitleLabel.textColor = [UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1/1.0];
        
        [compusoryCreditLabel setText:@"150"];
        compusoryCreditLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        compusoryCreditLabel.textColor = [UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1/1.0];
        [compusoryCreditLabel setTextAlignment:NSTextAlignmentRight];
        
        [commentCreditLabel setText:@"150"];
        commentCreditLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
        commentCreditLabel.textColor = [UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1/1.0];
        [commentCreditLabel setTextAlignment:NSTextAlignmentRight];
        
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
    
    [compusoryCreditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.right.equalTo(self).offset(-33);
        make.top.bottom.equalTo(self->compusoryCreditTitleLabel);
    }];
    
    [commentCreditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.right.equalTo(self->compusoryCreditLabel);
        make.top.bottom.equalTo(self->commentCreditTitleLabel);
    }];
}
@end
