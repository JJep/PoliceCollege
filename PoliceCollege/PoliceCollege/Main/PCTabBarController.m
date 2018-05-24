//
//  PCTabBarController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCTabBarController.h"
#import "PCPromotionViewController.h"
#import "PCNavigationController.h"
#import "MeViewController.h"
#import "LearningViewController.h"
#import "PersonViewController.h"
#import "PCLoginViewController.h"
#import "JMUserLocalData.h"
@interface PCTabBarController ()

@end

@implementation PCTabBarController

//-(void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
//{
//    self.tabBar.hidden = hidesBottomBarWhenPushed;
//}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    // 设置 TabBarItemTestAttributes 的颜色。
    [self setUpTabBarItemTextAttributes];
    
    // 设置子控制器
    [self setUpChildViewController];
    
    // 处理tabBar，使用自定义 tabBar 添加 发布按钮
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    //设置导航控制器颜色为白色
    [[UINavigationBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航控制器字体颜色为灰色
//    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:MyGrayColor,NSForegroundColorAttributeName,nil];
//    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
//    [[UINavigationBar appearance] setTintColor:MyGrayColor];
}

#pragma mark -
#pragma mark - Private Methods

/**
 *  利用 KVC 把 系统的 tabBar 类型改为自定义类型。
 */
//- (void)setUpTabBar{
//
//    [self setValue:[[GMoodTabBar alloc] init] forKey:@"tabBar"];
//}


/**
 *  tabBarItem 的选中和不选中文字属性
 */
- (void)setUpTabBarItemTextAttributes{
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = rgb(145, 140, 140);
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = rgb(115, 202, 108);
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateHighlighted];
    
}


/**
 *  添加子控制器，我这里值添加了4个，没有占位自控制器
 */
- (void)setUpChildViewController{
    
    [self addOneChildViewController:[[PCNavigationController alloc]initWithRootViewController:[[PCPromotionViewController alloc]init]]
                          WithTitle:@"党务宣传"
                          imageName:@"promotionUnselected"
                  selectedImageName:@"promotionSelected"];
    
    [self addOneChildViewController:[[PCNavigationController alloc]initWithRootViewController:[[LearningViewController alloc] init]]
                          WithTitle:@"党员学习"
                          imageName:@"learningUnselected"
                  selectedImageName:@"learningSelected"];
    
    if ([JMUserLocalData sharedManager].isLogin) {
        [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[PersonViewController alloc]init]]
                              WithTitle:@"个人中心"
                              imageName:@"personalCenterUnselected"
                      selectedImageName:@"personalCenterSelected"];
    } else {
        [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[PCLoginViewController alloc]init]]
                              WithTitle:@"个人中心"
                              imageName:@"personalCenterUnselected"
                      selectedImageName:@"personalCenterSelected"];
    }
    
    
    [self addOneChildViewController:[[PCNavigationController alloc]initWithRootViewController:[[MeViewController alloc]init]]
                          WithTitle:@"我的"
                          imageName:@"meUnselected"
                  selectedImageName:@"meSelected"];
    
}

/**
 *  添加一个子控制器
 *
 *  @param viewController    控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中图片
 */

- (void)addOneChildViewController:(UIViewController *)viewController WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    
    viewController.view.backgroundColor     = MyWhiteBackgroundColor;
    viewController.tabBarItem.title         = title;
    viewController.tabBarItem.image         = [UIImage imageNamed:imageName];
    UIImage *image = [UIImage imageNamed:selectedImageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = image;
    [self addChildViewController:viewController];
    
}


//这个方法可以抽取到 UIImage 的分类中
- (UIImage *)imageWithColor:(UIColor *)color
{
    NSParameterAssert(color != nil);
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
