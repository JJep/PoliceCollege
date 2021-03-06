//
//  CourseCenterTableViewCell.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchTableViewCell.h"
#import "Book.h"
@interface BookCenterTableViewCell : SearchTableViewCell
//@property (nonatomic,assign)BOOL isAlreadySelected;
@property (nonatomic,retain)UIImage *image;
@property (nonatomic,copy)NSString *courseName;
@property (nonatomic,copy)NSString *teacherName;
@property (nonatomic,copy)NSString *courseTime;
@property (nonatomic,assign)int credit;
@property (nonatomic,assign)int score;
@property (nonatomic,assign)int clicks;
@property (nonatomic,assign)int commentsQuantity;
- (void)setModel:(id)model ;
- (void)setModel:(id)model isSelected:(BOOL)isSelected;
@end
