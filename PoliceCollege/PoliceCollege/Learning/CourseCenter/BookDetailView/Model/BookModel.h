//
//  BookModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject
@property (nonatomic,copy)NSString *bookName;
@property (nonatomic,copy)NSString *bookWriter;
@property (nonatomic,copy)NSString *bookCategory;
@property (nonatomic,copy)NSString *bookStatus;
@property (nonatomic,retain)UIImage *bookImage;
@property (nonatomic,copy)NSString *bookIntroduction;
@property (nonatomic,retain)NSArray *bookChapters;
@end
