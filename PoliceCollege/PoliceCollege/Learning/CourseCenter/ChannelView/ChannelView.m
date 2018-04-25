//
//  ChannelView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/25.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "ChannelView.h"
#import "ChannelCollectionViewCell.h"
//@interface ChannelView() <UICollectionViewDelegate, UICollectionViewDataSource>
//@end
@implementation ChannelView {
    UIImageView *imageView;
    UIView *view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self initCollectionView];
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add"]];
        [self addSubview:imageView];
        view = [UIView new];
        [self addSubview:view];
        [view setBackgroundColor:MyGrayColor];
    }
    return self;
}

- (void)layoutSubviews {
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.right.equalTo(self->view.mas_left);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-16);
        make.height.width.mas_equalTo(14);
        make.centerY.equalTo(self);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->imageView.mas_left).offset(-16);
        make.width.mas_equalTo(2);
        make.height.mas_equalTo(20);
        make.centerY.equalTo(self);
    }];
    
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
//    _collectionView.dataSource = self;
//    _collectionView.delegate = self;
    
    //注册Cell
//    [_collectionView registerClass:[ChannelCollectionViewCell class] forCellWithReuseIdentifier:@"channelCell"];

}

//
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return 5;
//}
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    ChannelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channelCell" forIndexPath:indexPath];
//    return cell;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
