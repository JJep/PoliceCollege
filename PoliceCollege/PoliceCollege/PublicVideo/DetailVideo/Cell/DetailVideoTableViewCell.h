//
//  DetailVideoTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/10.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailVideo.h"
@interface DetailVideoTableViewCell : UITableViewCell
@property (nonatomic,retain)UIButton *playButton;
-(void)setModel:(DetailVideo *)model;
@end
