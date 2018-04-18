//
//  UITextfieldView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "UITextfieldView.h"
#import <Masonry.h>
@interface UITextfieldView() <UITextFieldDelegate>
@end

@implementation UITextfieldView {
    UIImageView *imageView;
    UITextField *textField;
//    UIView *backView;
}
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UIView *view = [[UIView alloc] initWithFrame:self.bounds];
        [view setBackgroundColor:  [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]];
        [self addSubview:view];
        
        textField = [UITextField new];
        imageView = [UIImageView new];

        [view addSubview:textField];
        [view addSubview:imageView];
        
        [textField setPlaceholder:self.placeHolderText];
        [imageView setImage:self.image];
        textField.delegate = self;
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self);
        }];
       
    }
    return self;
}

-(void)layoutSubviews {
//    __weak __typeof__(self) weakSelf = self;
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(15);
        make.bottom.equalTo(self.mas_bottom).offset(-15);
        make.left.equalTo(self->imageView.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.equalTo(self->imageView.mas_height);
    }];
}

-(void)setImage:(UIImage *)image
{
    if (_image != image) {
        _image = image;
        [imageView setImage:_image];
    }
}

-(void)setPlaceHolderText:(NSString *)placeHolderText {
    if (_placeHolderText != placeHolderText) {
        _placeHolderText = placeHolderText;
        textField.placeholder = _placeHolderText;
        [textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    }

}

- (void)setSecure:(BOOL)secure{
    if (_secure != secure) {
        _secure = secure;
        [textField setSecureTextEntry:_secure];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}

-(NSString *)text{
    return textField.text;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//
//
//}


@end
