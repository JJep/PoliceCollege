//
//  AnnouncementDataSource.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/20.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^AnnouncementTableViewCellConfigureBlock)(id cell, id item);
@interface AnnouncementDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(AnnouncementTableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (void)updateWithItems:(NSArray *)items; 
@end
