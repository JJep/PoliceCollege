//
//  BookTableView.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/4/26.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "BookIntroductionTableView.h"
#import "BookIntroductionTableViewCell.h"
#import "BookModel.h"
@interface BookIntroductionTableView() <UITableViewDelegate, UITableViewDataSource>
@end
@implementation BookIntroductionTableView {
    BookModel *bookModel;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;

    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return bookModel.bookChapters.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookIntroductionTableViewCell *cell = [self dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[BookIntroductionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.section == 0) {
        [cell setContent:bookModel.bookIntroduction];
    } else {
        [cell setContent:bookModel.bookChapters[indexPath.row]];
    }
    return cell;
}

@end
