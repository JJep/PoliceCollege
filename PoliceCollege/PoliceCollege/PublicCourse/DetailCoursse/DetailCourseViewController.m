//
//  DetailCourseViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "DetailCourseViewController.h"
#import "PCDetailCourseTableViewCell.h"
#import "WebVideoViewController.h"
#import "PCCourseViewModel.h"
#import "UIImage+ScaleToSize.h"
#import "CommentViewController.h"
@interface DetailCourseViewController () <UITableViewDelegate, UITableViewDataSource>

@end
static NSString *cellID = @"detailCourseCell";
static const int commentButtonTag = 456;
@implementation DetailCourseViewController {
    UITableView *tableView;
    PCCourseViewModel *courseViewModel;
    UIButton *commentButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self initData];
    [self getDetailCourse];
}

- (void)initData {
    courseViewModel = [PCCourseViewModel new];
}

- (void)getDetailCourse {
    [courseViewModel getDetailCourseAction:[NSNumber numberWithInteger:self.idField] success:^(id responseObject) {
        self.model = [DetailCourse yy_modelWithJSON:[responseObject objectForKey:@"course"]];
        [self updateUI];
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)updateUI {
    [tableView reloadData];
}

- (void)initViews {
    tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[PCDetailCourseTableViewCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    commentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:commentButton];
    [commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    [commentButton setTitle:@"评论" forState:UIControlStateNormal];
    [commentButton addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [commentButton setTag:commentButtonTag];
    [commentButton setHidden:true];
    UIImage *image = [UIImage imageNamed:@"comment"];
    image = [UIImage scaleToSize:image size:CGSizeMake(15, 15)];
    [commentButton setImage:image forState:UIControlStateNormal];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PCDetailCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    [cell setModel:self.model];
    [cell.playButton addTarget:self action:@selector(playVideo:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)playVideo:(UIButton *)button {
    WebVideoViewController *webVideoViewcontroller = [WebVideoViewController new];
    webVideoViewcontroller.URLString = self.model.videoUrl;
    [self.navigationController pushViewController:webVideoViewcontroller animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didTouchBtn:(UIButton *)button {
    CommentViewController *commentVC = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:commentVC animated:true];
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
