//
//  Situation.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/13.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Situation : NSObject
@property (nonatomic, assign) NSInteger bookc;
@property (nonatomic, assign) NSInteger bookjyc;
@property (nonatomic, assign) NSInteger bookjyn;
@property (nonatomic, assign) NSInteger bookn;
@property (nonatomic, assign) NSInteger bxzxf;
@property (nonatomic, assign) NSInteger commentbookc;
@property (nonatomic, assign) NSInteger commentbookn;
@property (nonatomic, assign) NSInteger commentc;
@property (nonatomic, assign) NSInteger commentcoursec;
@property (nonatomic, assign) NSInteger commentcoursen;
@property (nonatomic, assign) NSInteger commentjyc;
@property (nonatomic, assign) NSInteger commentjyn;
@property (nonatomic, assign) NSInteger commentn;
@property (nonatomic, assign) NSInteger commentvideoc;
@property (nonatomic, assign) NSInteger commentvideon;
@property (nonatomic, assign) NSInteger coursebxc;
@property (nonatomic, assign) NSInteger coursebxn;
@property (nonatomic, assign) NSInteger coursec;
@property (nonatomic, assign) NSInteger coursejyc;
@property (nonatomic, assign) NSInteger coursejyn;
@property (nonatomic, assign) NSInteger coursen;
@property (nonatomic, assign) CGFloat creditc;//总学分
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger quarterCommentn;//评论数量
@property (nonatomic, assign) CGFloat quarterScore;//本季度学分
@property (nonatomic, assign) NSInteger quarterScorebx;//本季度必修学分
@property (nonatomic, assign) NSInteger quarterScorepl;
@property (nonatomic, strong) NSString * uid;
@property (nonatomic, assign) NSInteger userid;
@property (nonatomic, assign) NSInteger videobxc;
@property (nonatomic, assign) NSInteger videobxn;
@property (nonatomic, assign) CGFloat videoc;
@property (nonatomic, assign) CGFloat videojyc;
@property (nonatomic, assign) NSInteger videojyn;
@property (nonatomic, assign) NSInteger videon;
@end
