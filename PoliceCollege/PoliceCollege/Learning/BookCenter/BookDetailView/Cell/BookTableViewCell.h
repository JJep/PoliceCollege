//
//  BookView.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "SearchTableViewCell.h"
#import "Book.h"
@interface BookTableViewCell : SearchTableViewCell
@property(nonatomic,retain)UIButton *readBtn;
@property(nonatomic,retain)UIButton *downloadBtn;
//@property(nonatomic,retain)BookModel *bookModel;
@property(nonatomic,retain)UIButton *introductionBtn;
@property(nonatomic,retain)UIButton *commentBtn;
@property(nonatomic,retain)UIView *leftView;
@property(nonatomic,retain)UIView *rightView;
-(void)setModel:(Book *)book;
@end
