//
//  PersonalInfoTableViewCell.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SeasonTableViewCell.h"

@implementation SeasonTableViewCell {
    UILabel *titleLabel;
    UILabel *contentLabel;
    UIImageView *moreImageView;
    UILabel *compusoryCreditTitleLabel;
    UILabel *commentCreditTitleLabel;
    UILabel *compusoryCreditLabel;
    UILabel *commentCreditLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        titleLabel = [UILabel new];
        contentLabel = [UILabel new];
        moreImageView = [UIImageView new];
        compusoryCreditLabel = [UILabel new];
        commentCreditLabel = [UILabel new];
        compusoryCreditTitleLabel = [UILabel new];
        commentCreditTitleLabel = [UILabel new];
        [self addSubview:titleLabel];
        [self addSubview:contentLabel];
        [self addSubview:moreImageView];
        [self addSubview:compusoryCreditTitleLabel];
        [self addSubview:compusoryCreditLabel];
        [self addSubview:commentCreditTitleLabel];
        [self addSubview:commentCreditLabel];
        [titleLabel setText:@"title"];
        [contentLabel setText:@"content"];
        [moreImageView setImage:[UIImage imageNamed:@"arrow"]];
        
        titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:15];
        titleLabel.textColor = [UIColor colorWithRed:53/255.0 green:136/255.0 blue:229/255.0 alpha:1/1.0];
        
        contentLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:15];
        contentLabel.textColor = [UIColor colorWithRed:53/255.0 green:136/255.0 blue:229/255.0 alpha:1/1.0];
        [contentLabel setTextAlignment:NSTextAlignmentRight];
        
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

- (void)setModel:(SeasonCreditModel *)model {
    if (!_model || _model != model  ) {
        _model = model;
        [titleLabel setText:[NSString stringWithFormat:@"第%d季度", _model.season]];
        [contentLabel setText:[NSString stringWithFormat:@"%d",_model.credit]];
    }
}

- (void)layoutViews {
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-280);
        make.top.equalTo(self).offset(15);
//        make.height.mas_equalTo(21);
        make.bottom.equalTo(self).offset(-14);
    }];
    
    [moreImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self->contentLabel);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(18);
    }];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->titleLabel.mas_right).offset(30);
        make.right.equalTo(self->moreImageView.mas_left).offset(-5);
        make.top.equalTo(self).offset(14);
        make.height.mas_equalTo(21);
    }];
    
    [compusoryCreditTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self).offset(-200);
        make.top.equalTo(self->titleLabel.mas_bottom).offset(20);
        make.bottom.equalTo(self->commentCreditTitleLabel.mas_top).offset(-6);
    }];
    
    [commentCreditTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->compusoryCreditTitleLabel);
        make.bottom.equalTo(self).offset(-6);
        make.right.equalTo(self->compusoryCreditTitleLabel);
    }];
    
    [compusoryCreditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.right.equalTo(self->contentLabel);
        make.top.bottom.equalTo(self->compusoryCreditTitleLabel);
    }];
    
    [commentCreditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.right.equalTo(self->contentLabel);
        make.top.bottom.equalTo(self->commentCreditTitleLabel);
    }];
    
}

//- (void)setSelected:(BOOL)selected {
////    if (self.selected != selected) {
////        self.selected = selected;
//        [compusoryCreditLabel setHidden:!self.selected];
//        [compusoryCreditTitleLabel setHidden:!self.selected];
//        [commentCreditLabel setHidden:!self.selected];
//        [commentCreditTitleLabel setHidden:!self.selected];
//        if (selected) {
//            [titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.left.equalTo(self).offset(15);
//                make.right.equalTo(self).offset(-280);
//                make.top.equalTo(self).offset(15);
//                make.height.mas_equalTo(21);
////                make.bottom.equalTo(self).offset(-14);
//            }];
//        }
////    }
//}
@end
