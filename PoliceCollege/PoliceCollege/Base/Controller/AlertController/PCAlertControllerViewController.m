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
        [self setValue:[NSNumber numberWithInt:UIAlertControllerStyleAlert] forKey:@"preferredStyle"];
        
        // 使用富文本来改变alert的message字体大小和颜色
        // NSMakeRange(0, 2) 代表:从0位置开始 两个字符
        NSMutableAttributedString *messageText = [[NSMutableAttributedString alloc] initWithString:@"这里是正文信息"];
        [messageText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(0, 6)];
        [messageText addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
        [messageText addAttribute:NSForegroundColorAttributeName value:[UIColor brownColor] range:NSMakeRange(3, 3)];
        [self setValue:messageText forKey:@"attributedMessage"];
        
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        // 设置按钮背景图片
        UIImage *accessoryImage = [[UIImage imageNamed:@"selectRDImag.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [cancelAction setValue:accessoryImage forKey:@"image"];
        
        // 设置按钮的title颜色
        [cancelAction setValue:[UIColor lightGrayColor] forKey:@"titleTextColor"];
        
        // 设置按钮的title的对齐方式
        [cancelAction setValue:[NSNumber numberWithInteger:NSTextAlignmentCenter] forKey:@"titleTextAlignment"];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        
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
