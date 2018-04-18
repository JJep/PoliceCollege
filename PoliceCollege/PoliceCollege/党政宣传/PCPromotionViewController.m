//
//  PCPromotionViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/18.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCPromotionViewController.h"
#import "PCBannerView.h"
#import "PCCenterdView.h"
#import "PCCentralIssueView.h"
@interface PCPromotionViewController ()
@property (nonatomic,retain)PCBannerView *bannerView;
@property (nonatomic,retain)PCCenterdView *centeredView;
@property (nonatomic,retain)PCCentralIssueView *issueView;
@end

@implementation PCPromotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    _bannerView = [PCBannerView new];
    _centeredView = [PCCenterdView new];
    _issueView = [PCCentralIssueView new];
    
    [self.view addSubview:_bannerView];
    [self.view addSubview:_centeredView];
    [self.view addSubview:_issueView];
    
    [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(244.3);
    }];
    
    [_centeredView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.top.equalTo(self->_bannerView.mas_bottom).offset(3.7);
        make.height.mas_equalTo(80);
    }];
    
    [_issueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_centeredView.mas_bottom).offset(15);
        make.left.equalTo(self.view.mas_left).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.bottom.equalTo(self.view.mas_bottom).offset(-15);
    }];
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
