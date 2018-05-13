//
//  PCChapterViewModel.h
//  PoliceCollege
//
//  Created by Jep Xia on 2018/5/9.
//  Copyright © 2018年 Jep Xia. All rights reserved.
//

#import "PCViewModel.h"

@interface PCChapterViewModel : PCViewModel
- (void)getChapterListWithBookIDAction:(NSNumber *)bookID success:(PCSuccessHandler)success fail:(PCFailedHandler)fail;
@end
