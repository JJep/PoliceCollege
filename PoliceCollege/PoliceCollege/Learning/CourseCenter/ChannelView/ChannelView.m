//
//  ChannelView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "ChannelView.h"

@implementation ChannelView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initCollectionView];
    }
    return self;
}

- (void)initCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置cell的尺寸
    layout.itemSize = CGSizeMake(66, 22);
    // 设置每一行的间距
    layout.minimumLineSpacing = 20;
    // 设置每个cell的间距
    layout.minimumInteritemSpacing = 20;
    // 设置每组的内边距
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //设置CollectionView的属性
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    
    _collectionView.scrollEnabled = YES;
    
    [self addSubview:_collectionView];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
