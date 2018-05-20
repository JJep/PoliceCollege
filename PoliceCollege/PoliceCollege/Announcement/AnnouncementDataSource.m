//
//  AnnouncementDataSource.m
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "AnnouncementDataSource.h"

@interface AnnouncementDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) AnnouncementTableViewCellConfigureBlock configureCellBlock;

@end


@implementation AnnouncementDataSource

- (id)init
{
    return nil;
}

- (void)updateWithItems:(NSArray *)items
{
    self.items = items;
}

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(AnnouncementTableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}


#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

@end
