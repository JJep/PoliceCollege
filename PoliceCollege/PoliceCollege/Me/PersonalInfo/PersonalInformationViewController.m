//
//  PersonalInformationViewController.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PersonalInformationViewController.h"
#import "PersonalInfoTableViewCell.h"
#import "UserInfo.h"
#import "UserViewModel.h"
#import "ChangeTextViewController.h"
#import "ELCImagePickerController.h"
@interface PersonalInformationViewController () <UITableViewDelegate, UITableViewDataSource, ELCImagePickerControllerDelegate>

@end

@implementation PersonalInformationViewController {
    UITableView *tableView;
    NSMutableArray *dataArray;
    UserInfo *userInfo;
    UserViewModel *userViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    [self initDataArray];
    [self getData];
}

- (void)getData {
    [userViewModel getUserInfoAction:^(id responseObject) {
        self->userInfo = [UserInfo yy_modelWithJSON:[responseObject objectForKey:@"userInfo"]];
        [self->tableView reloadData];
    } fail:^(NSError *error) {
        
    }];
}

- (void)initViews {
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    dataArray = [NSMutableArray new];
    self.title = @"个人资料";
    
    [tableView registerClass:[PersonalInfoTableViewCell class] forCellReuseIdentifier:@"portraitCell"];
    [tableView registerClass:[PersonalInfoTableViewCell class] forCellReuseIdentifier:@"itemCell"];
    
}

- (void)initDataArray {
    userViewModel = [UserViewModel new];
    dataArray = [[NSMutableArray alloc]
                 initWithArray:@[
  @{@"头像":@"headimg"},
  @{@"账号":@"phone"},
  @{@"昵称":@"nickname"},
  @{@"性别":@"sex"},
  @{@"出生日期":@"birthday"},
  @{@"家乡":@"hometown"},
  @{@"现居地":@"livingplace"},
  @{@"职业":@"pos"},
  @{@"兴趣":@"hobby"},
  @{@"一句家乡话":@"nativeDialect"}
  ]];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalInfoTableViewCell *cell ;
    if (indexPath.row == 0) {
        NSString *cellID = @"portraitCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        NSString *valueString = [((NSDictionary *)dataArray[indexPath.row]) allValues][0] ;
        NSString *keyString =[((NSDictionary *)dataArray[indexPath.row]) allKeys][0];
        [cell setTitle:keyString];
        [cell setImageURL:[userInfo valueForKey:valueString]];
    } else {
        NSString *cellID = @"itemCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        NSString *valueString = [((NSDictionary *)dataArray[indexPath.row]) allValues][0] ;
        NSString *keyString =[((NSDictionary *)dataArray[indexPath.row]) allKeys][0];
        [cell setTitle:keyString];
        [cell setContent:[userInfo valueForKey:valueString]];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalInfoTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    NSString *keyString =[((NSDictionary *)dataArray[indexPath.row]) allKeys][0];
    static NSString *pickerIndexString = @"居住地家乡出生日期性别";
    if ([keyString isEqualToString:@"头像"]) {
        //点击头像，从相册选择图片或者拍照
        // Create the image picker
        ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
        elcPicker.maximumImagesCount = 1; //Set the maximum number of images to select, defaults to 4
        elcPicker.returnsOriginalImage = NO; //Only return the fullScreenImage, not the fullResolutionImage
        elcPicker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
        elcPicker.onOrder = YES; //For multiple image selection, display and return selected order of images
        elcPicker.imagePickerDelegate = self;
        //Present modally
        [self presentViewController:elcPicker animated:YES completion:nil];
    } else if ([pickerIndexString containsString:keyString]) {
        
    } else {
        ChangeTextViewController *changeTextVC = [[ChangeTextViewController alloc] init];
        [self.navigationController pushViewController:changeTextVC animated:true];
        changeTextVC.name = keyString;
    }
    cell.selected = NO;
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info {
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker {
    [picker dismissViewControllerAnimated:true completion:nil];
}


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:false];
}


@end
