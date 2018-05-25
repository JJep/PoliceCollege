//
//  SendCommentView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SendCommentView.h"

@implementation SendCommentView {
    UILabel *titleLabel;
}

- (instancetype)init {
    if (self = [super init]) {
        titleLabel = [UILabel new];
        _textView = [UITextView new];
        _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_textView];
        [self addSubview:_commentButton];
        [self addSubview:titleLabel];
        
        titleLabel.text = @"发表回复";
        titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:15];
        titleLabel.textColor = [UIColor colorWithRed:19/255.0 green:18/255.0 blue:19/255.0 alpha:1/1.0];

        
//        [_textView setValue:@"测试一下placeholder" forKey:@"placeHolderLabel.placeholder"];
//        [_textView setValue:@"placeholder" forKey:[[_textView valueForKey:@"placeholderLabel"] valueForKey:@"text"]];

        [[_textView valueForKey:@"placeholderLabel"] setValue:@"placeholder" forKey:@"text"];
        [_textView setBackgroundColor:MyLightGrayColor];
        
        [_commentButton setTitle:@"发表" forState:UIControlStateNormal];
        [_commentButton setTitleColor:rgba(74,144,226,1) forState:UIControlStateNormal];
        [_commentButton.layer setBorderColor:rgba(74,144,226,1).CGColor];
        [_commentButton.layer setBorderWidth:1.0f];
        [_commentButton.layer setCornerRadius:15];
//        [_commentButton addTarget:self action:@selector(uploadComment) forControlEvents:UIControlEventTouchUpInside];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
        }];
        
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self->titleLabel.mas_bottom).offset(10);
            make.right.equalTo(self).offset(-15);
            make.height.mas_equalTo(85);
        }];
        
        [_commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(92);
            make.bottom.equalTo(self).offset(-10);
        }];
    }
    return self;
}
//
//- (void)uploadComment {
//    NSLog(@"uploadComment");
//}

@end
