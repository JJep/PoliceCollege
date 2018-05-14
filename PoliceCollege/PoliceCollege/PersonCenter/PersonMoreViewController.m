//
//  PersonMoreViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/28.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PersonMoreViewController.h"
#import "SeasonRank.h"
#import "SeasonTableViewCell.h"
#import "PCPickerView.h"
#import "SeasonSubview.h"
#import "PCCurrentDate.h"
#import "PersonCenterViewModel.h"
#import "SeasonCredit.h"
#import "Season.h"
@interface PersonMoreViewController () <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@end
static const int cancelButtonTag = 123;
static const int confirmButtonTag = 1234;
static const int calenderButtonTag = 12345;
@implementation PersonMoreViewController {
    SeasonRank *seasonRankView;
    UITableView *seasonTableView;
    PCPickerView *pickerView;
    NSMutableArray *selectedArray;
    NSMutableArray *yearArray;
    SeasonCredit *seasonCredit;
    NSUInteger selectedYear;
    NSUInteger currentYear;
    PersonCenterViewModel *personCenterViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initViews];
    [self getData];
}

- (void)getData {
    [personCenterViewModel getFourSeasonsCreditActionWithYear:[NSNumber numberWithInteger:currentYear] success:^(id responseObject) {

        NSDictionary *dict = (NSDictionary *)[responseObject objectForKey:@"quarterScore"];
        NSLog(@"%@",dict);
        self->seasonCredit = [SeasonCredit new];
        self->seasonCredit = [self->seasonCredit initWithDictionary:dict];
        [self->seasonTableView reloadData];
    } fail:^(NSError *error) {
        
    }];
}

- (void)initData {
    selectedArray = [[NSMutableArray alloc] initWithArray:@ [@false,
                                                             @false,
                                                             @false,
                                                             @false]];
    PCCurrentDate *currentDate = [PCCurrentDate new];
    yearArray = [NSMutableArray new];
    currentYear = selectedYear = currentDate.year;
    for (int i = 0; i < 10 ; i ++)
        [yearArray addObject:[NSString stringWithFormat:@"%lu", currentDate.year - i]];
    personCenterViewModel = [PersonCenterViewModel new];
}

- (void)initViews {
    //设置背景色
    [self.view setBackgroundColor:MyWhiteBackgroundColor];
    
    //设置导航栏的按钮
    UIButton *rightButtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButtn setImage:[UIImage imageNamed:@"calender"] forState:UIControlStateNormal];
    [rightButtn setTag:calenderButtonTag];
    [rightButtn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItemButton = [[UIBarButtonItem alloc] initWithCustomView:rightButtn];
    [self.navigationItem setRightBarButtonItem:rightItemButton];
    
    //设置子view
    seasonRankView = [SeasonRank new];
    [seasonRankView.rankLabel setText:[NSString stringWithFormat:@"%lu", self.myRanking]];
    [seasonRankView setModel:self.currentSeasonSituation];
    

    
    seasonTableView = [UITableView new];
    seasonTableView.delegate = self;
    seasonTableView.dataSource = self;
    [seasonTableView registerClass:[SeasonTableViewCell class] forCellReuseIdentifier:@"seasonCell"];
    
    pickerView = [PCPickerView new];
    pickerView.pickerView.delegate = self;
    pickerView.pickerView.dataSource = self;
    [pickerView.cancelButton addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [pickerView.confirmButton addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [pickerView.cancelButton setTag:cancelButtonTag];
    [pickerView.confirmButton setTag:confirmButtonTag];
    [pickerView setHidden:true];
    
    [self.view addSubview:seasonTableView];
    [self.view addSubview:seasonRankView];
    [self.view addSubview:pickerView];

    
    [seasonTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self->seasonRankView);
        make.top.equalTo(self->seasonRankView.mas_bottom).offset(15);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    
    [seasonRankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.top.equalTo(self.view).offset(15);
        make.height.mas_equalTo(170);
    }];
    
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(220);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"seasonCell";
    SeasonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if ([selectedArray[indexPath.row] isEqual:@false]) {
        [cell.seasonSubview setHidden:true];
    } else {
        [cell.seasonSubview setHidden:false];
    }
    [cell setModelWithSeason:indexPath.row model:seasonCredit];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([selectedArray[indexPath.row] isEqual:@false]) {
        selectedArray[indexPath.row] = @true;
    } else {
        selectedArray[indexPath.row] = @false;
    }
    [tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([selectedArray[indexPath.row] isEqual:@true]) {
        return 112;
    } else {
        return 56;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.font = [UIFont fontWithName:@"PingFang-SC-Semibold" size:18];
    [headerLabel setText:[NSString stringWithFormat:@"%lu 年", currentYear]];
    [headerLabel setTextAlignment:NSTextAlignmentCenter];
    return headerLabel;
}

- (void)didTouchBtn:(UIButton *)button {
    switch (button.tag) {
        case cancelButtonTag:
        {
            [pickerView setHidden:true];
            break;
        }
        case confirmButtonTag:
            [pickerView setHidden:true];
            currentYear = selectedYear;
            [self getData];
            [seasonTableView reloadData];
            break;
        case calenderButtonTag:
            [pickerView setHidden:false];
        default:
            break;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return yearArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return yearArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    selectedYear = [yearArray[row] integerValue];
}



@end
