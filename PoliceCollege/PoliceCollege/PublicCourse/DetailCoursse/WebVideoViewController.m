//
//  WebVideoViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "WebVideoViewController.h"
#import <WebKit/WebKit.h>
@interface WebVideoViewController ()<WKUIDelegate, WKNavigationDelegate>

@end

@implementation WebVideoViewController {
    WKWebView *webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
}

- (void)initViews {
    webView = [[WKWebView alloc] init];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    NSURL *requestURL = [NSURL pc_videoURLWithString:self.URLString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [webView loadRequest:request];
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    
}


@end
