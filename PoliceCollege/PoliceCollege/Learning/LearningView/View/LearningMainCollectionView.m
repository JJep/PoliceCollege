//
//  LearningMainCollectionView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/28.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "LearningMainCollectionView.h"
#import "LearningTableViewCell.h"
@interface LearningMainCollectionView() <UICollectionViewDataSource>
@end;
@implementation LearningMainCollectionView {
    NSArray *dataArray;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {

        [self setBackgroundColor:[UIColor whiteColor]];
        self.dataSource = self;
        //注册Cell
        [self registerClass:[LearningTableViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self initData];
    }
    return self;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LearningTableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell setImage:dataArray[indexPath.row][@"image"]];
    [cell setTitle:dataArray[indexPath.row][@"title"]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (void) initData {
    dataArray = @[
                  @{
                      @"image":[UIImage imageNamed:@"onlineTest"],
                      @"title":@"在线测试"
                      },
                  @{
                      @"image":[UIImage imageNamed:@"courseCenter"],
                      @"title":@"课程中心"
                      },
                  @{
                      @"image":[UIImage imageNamed:@"bookCenter"],
                      @"title":@"图书中心"
                      },
                  @{
                      @"image":[UIImage imageNamed:@"videoCenter"],
                      @"title":@"视频中心"
                      },
                  @{
                      @"image":[UIImage imageNamed:@"onlineTest"],
                      @"title":@"在线测试"
                      },
                  @{
                      @"image":[UIImage imageNamed:@"courseCenter"],
                      @"title":@"课程中心"
                      },
                  @{
                      @"image":[UIImage imageNamed:@"bookCenter"],
                      @"title":@"图书中心"
                      },
                  @{
                      @"image":[UIImage imageNamed:@"videoCenter"],
                      @"title":@"视频中心"
                      }
                  ];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
