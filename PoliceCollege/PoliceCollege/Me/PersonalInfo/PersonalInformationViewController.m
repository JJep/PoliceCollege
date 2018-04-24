//
//  PersonalInformationViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PersonalInformationViewController.h"
#import "PersonalInfoTableViewCell.h"
#import "PersonalInfoModel.h"
@interface PersonalInformationViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PersonalInformationViewController {
    UITableView *tableView;
    NSMutableArray *dataArray;
    PersonalInfoModel *model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    dataArray = [NSMutableArray new];
    self.title = @"个人资料";
    [self initDataArray];
    // Do any additional setup after loading the view.
}

- (void)initDataArray {
//    dataArray = @[
//                  @{@"头像":perso}
//                  ]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self animateTabl];
//}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalInfoTableViewCell *cell ;
    if (indexPath.row == 0) {
        NSString *cellID = @"portraitCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        cell = [[PersonalInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        [cell setImage:[UIImage imageNamed:@"portrait"]];
    } else {
        NSString *cellID = @"itemCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        cell = [[PersonalInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 106;
    } else {
        return 50;
        
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:false];
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 9) {
//        [self animateTabl];
//    }
//}
//
//- (void)animateTabl {
//
//    NSArray *cells = tableView.visibleCells;
//
//    CGFloat tableHeight = tableView.bounds.size.height;
//
//    [cells enumerateObjectsUsingBlock:^(PersonalInfoTableViewCell *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        obj.transform = CGAffineTransformMakeTranslation(0, tableHeight);
//        [UIView animateWithDuration:1.0
//                              delay:0.05* (double)idx
//             usingSpringWithDamping:0.8
//              initialSpringVelocity:0
//                            options:UIViewAnimationOptionTransitionNone
//                         animations:^{
//                     obj.transform = CGAffineTransformMakeTranslation(0, 0);
//
//        }
//                         completion:^(BOOL finished) {
//        }];
//    }];
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
