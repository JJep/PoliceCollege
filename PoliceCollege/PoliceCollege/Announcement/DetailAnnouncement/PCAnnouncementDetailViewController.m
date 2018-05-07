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
@interface PCAnnouncementDetailViewController () <UITableViewDelegate, UITableViewDataSource>

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

- (void)initViews {
    
    if (self.model.isLink) {
        webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:webView];
//        webView.UIDelegate = self;
//        webView.navigationDelegate = self;
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.model.content]]];
    } else {
        tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        viewModel = [PCAnnouncementViewModel new];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
    }
    [self.navigationController setNavigationBarHidden:true animated:true];
}

- (void)getDetailAnnouncement {
    [viewModel getDetailAnnouncementActionWithID:[NSNumber numberWithInteger:_announcementID] success:^(id responseObject) {
        
    } fail:^(NSError *error) {
        
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"promotionDetailCell";
    PCAnnouncementTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell = [[PCAnnouncementTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(15, 5, 30, 30)];
    [cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:cancelButton];
    
    [cell setModel:self.model];
    
    return cell;
}

- (void)cancel {
    [self.navigationController popViewControllerAnimated:true];
}





















@end
