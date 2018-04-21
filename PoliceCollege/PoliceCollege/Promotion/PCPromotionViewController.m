//
//  PCPromotionViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCPromotionViewController.h"
#import "PCCenterdView.h"
#import "PCPromotionView.h"
#import "PCCenterdViewButton.h"
#import "PCAnouncementTableViewController.h"
#define leftBtnTag 123
#define centerBtnTag 1234
#define rightBtnTag 12345

@interface PCPromotionViewController ()

@end

@implementation PCPromotionViewController {
    PCPromotionView *promotionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
//
    promotionView = [[PCPromotionView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:promotionView];
    
    [promotionView.centerView.leftBtn  addTarget:self action:@selector(touchedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [promotionView.centerView.centerBtn  addTarget:self action:@selector(touchedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [promotionView.centerView.rightBtn  addTarget:self action:@selector(touchedBtn:) forControlEvents:UIControlEventTouchUpInside];

    [promotionView.centerView.leftBtn  setTag:leftBtnTag];
    [promotionView.centerView.centerBtn  setTag:centerBtnTag];
    [promotionView.centerView.rightBtn  setTag:rightBtnTag];
}

- (void)touchedBtn:(UIButton *)button {
    switch (button.tag) {
        case leftBtnTag:
        {
            PCAnouncementTableViewController *newVC = [PCAnouncementTableViewController new];

            [self.navigationController pushViewController:newVC animated:true];
            break;
        }
        case centerBtnTag:
            break;
        case rightBtnTag:
            break;

        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = NO;
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
