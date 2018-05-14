//
//  PCPromotionDetailViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/2.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCAnnouncementDetailViewController.h"
#import "PCAnnouncementTextTableViewCell.h"
#import "PCAnnouncementModel.h"
#import "PCAnnouncementViewModel.h"
#import <WebKit/WebKit.h>
@interface PCAnnouncementDetailViewController () <WKUIDelegate, WKNavigationDelegate>

@end

@implementation PCAnnouncementDetailViewController {
    UITableView *tableView;
    PCAnnouncementViewModel *viewModel;
    WKWebView *webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self initViews];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

- (void)initViews {
    [SVProgressHUD show];
    
    webView = [[WKWebView alloc] init];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;

    [self.view addSubview:webView];
    
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    if ([self.model.isLink isEqualToString:@"0"]) {
        
        NSString *headerString = @"<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header>";
        [webView loadHTMLString:[headerString stringByAppendingString:self.model.content] baseURL:nil];
    } else {
        NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.model.content]];
        [webView loadRequest:request];
    }

}
//开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载网页");
}

//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
    [SVProgressHUD dismiss];
    //加载完成后隐藏progressView
    //self.progressView.hidden = YES;
}

//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败");
    [SVProgressHUD dismiss];
    [SVProgressHUD showErrorWithStatus:@"网络连接错误"];
    //加载失败同样需要隐藏progressView
    //self.progressView.hidden = YES;
}

- (void)getDetailAnnouncement {
    [viewModel getDetailAnnouncementActionWithID:[NSNumber numberWithInteger:_announcementID] success:^(id responseObject) {
        
    } fail:^(NSError *error) {
        
    }];
}

- (void)cancel {
    [self.navigationController popViewControllerAnimated:true];
}












@end
