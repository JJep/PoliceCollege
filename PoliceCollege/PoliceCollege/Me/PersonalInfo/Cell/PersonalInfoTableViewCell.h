//
//  PersonalInfoTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/23.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PersonalInfoTableViewCell : UITableViewCell
@property (nonatomic,retain)UIImage *image;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *content;
- (void)setImageURL:(NSString *)string;

@end
