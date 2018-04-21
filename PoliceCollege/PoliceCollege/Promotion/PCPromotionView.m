//
//  PCPromotionView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCPromotionView.h"
#import "PCBannerView.h"
#import "PCCenterdView.h"
#import "PCHotIssueView.h"
#import "HotIssueTableViewCell.h"
@interface PCPromotionView ()<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic)CGFloat topContentOffset;
@end

@implementation PCPromotionView {

}
float lastContentOffsetY;//用于监听scrollvie垂直滑动的数据
float lastContentOffsetX;//监听水平滑动

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _bannerView = [PCBannerView new];
        _centerView = [PCCenterdView new];
        _hotIssueView = [PCHotIssueView new];
        
        [self addSubview:_bannerView];
        [self addSubview:_centerView];
        [self addSubview:_hotIssueView];
        
        _hotIssueView.hotIssueTableView.delegate = self;
        _hotIssueView.hotIssueTableView.dataSource = self;
        
        [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo(244.3);
        }];
        
        [_centerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(15);
            make.right.equalTo(self.mas_right).offset(-15);
            make.top.equalTo(self->_bannerView.mas_bottom).offset(3.7);
            make.height.mas_equalTo(80);
        }];
        
        [_hotIssueView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_centerView.mas_bottom).offset(15);
            make.left.equalTo(self.mas_left).offset(15);
            make.right.equalTo(self.mas_right).offset(-15);
            make.bottom.equalTo(self.mas_bottom).offset(-15);
        }];
        
        self.topContentOffset = _hotIssueView.hotIssueTableView.contentOffset.y;
        
    }
    return self;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    HotIssueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[HotIssueTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    lastContentOffsetY = scrollView.contentOffset.y;
    lastContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if (lastContentOffsetY < scrollView.contentOffset.y) {
        NSLog(@"向上滚动");
        if (lastContentOffsetY == self.topContentOffset) {
//            [self reConfigUI:kStartDrag];
            [self hotIssueViewToTop];
        }
    }else{
        NSLog(@"向下滚动");
    }
}

- (void)hotIssueViewToTop {
    [UIView animateWithDuration:0.3 animations:^{
        [self->_bannerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.height.mas_equalTo(244.3);
            make.bottom.equalTo(self.mas_top).offset(-3.7 - self->_centerView.bounds.size.height);
        }];
        
        [self->_hotIssueView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_centerView.mas_bottom).offset(20);
            make.left.equalTo(self.mas_left).offset(15);
            make.right.equalTo(self.mas_right).offset(-15);
            make.bottom.equalTo(self.mas_bottom).offset(-15);
        }];
        
        [self layoutIfNeeded];
    }];
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"scrollViewWillEndDragging");
    CGFloat offsetY = targetContentOffset -> y;
//    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    NSLog(@"%lf %lf %lf",offsetY,lastContentOffsetY,self.topContentOffset);
    
    if (offsetY-lastContentOffsetY > 0)
        [self hotIssueViewToTop];
    
    if (offsetY == 0 && lastContentOffsetY == self.topContentOffset ) {
        [UIView animateWithDuration:0.3 animations:^{
            
            [self->_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(self);
                make.height.mas_equalTo(244.3);
            }];

            [self->_hotIssueView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->_centerView.mas_bottom).offset(15);
                make.left.equalTo(self.mas_left).offset(15);
                make.right.equalTo(self.mas_right).offset(-15);
                make.bottom.equalTo(self.mas_bottom).offset(-15);
            }];
            
            [self layoutIfNeeded];

        }];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
