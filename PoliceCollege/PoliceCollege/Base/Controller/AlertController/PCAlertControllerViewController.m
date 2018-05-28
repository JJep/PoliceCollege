//
//  PCAlertControllerViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/3.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCAlertControllerViewController.h"

@interface PCAlertControllerViewController ()
@end

@implementation PCAlertControllerViewController

- (instancetype)initWithMessage:(NSString *)message {
    if (self = [super init] ) {
        //设置样式
        [self setValue:[NSNumber numberWithInt:UIAlertControllerStyleAlert] forKey:@"preferredStyle"];
        
        // 使用富文本来改变alert的message字体大小和颜色

        NSMutableAttributedString *messageText = [[NSMutableAttributedString alloc] initWithString:message];
        
        [messageText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFang-SC-Regular" size:18] range:NSMakeRange(0, message.length-1)];
        [messageText addAttribute:NSForegroundColorAttributeName value:rgb(74, 74, 74) range:NSMakeRange(0, message.length-1)];

        [self setValue:messageText forKey:@"attributedMessage"];
        
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//        UIAlertAction *actrio = [uialertac]
        
//        // 设置按钮背景图片
//        UIImage *accessoryImage = [[UIImage imageNamed:@"selectRDImag.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        [cancelAction setValue:accessoryImage forKey:@"image"];
        
        
        UIView *firstSubview = self.view.subviews.firstObject;
        
        UIView *alertContentView = firstSubview.subviews.firstObject;
        for (UIView *subSubView in alertContentView.subviews) { //This is main catch
            subSubView.backgroundColor = MyWhiteBackgroundColor; //Here you change background
            subSubView.layer.cornerRadius = 0; //取消圆角
        }

        
        // 设置按钮的title颜色
        [cancelAction setValue:[UIColor lightGrayColor] forKey:@"titleTextColor"];
        
        // 设置按钮的title的对齐方式
        [cancelAction setValue:[NSNumber numberWithInteger:NSTextAlignmentCenter] forKey:@"titleTextAlignment"];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [self addAction:okAction];
        [self addAction:cancelAction];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"内容" preferredStyle:UIAlertControllerStyleAlert];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
