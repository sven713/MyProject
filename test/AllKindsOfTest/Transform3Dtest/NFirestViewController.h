//
//  NFirestViewController.h
//  test
//
//  Created by 宋锡铭 on 2019/5/14.
//  Copyright © 2019 sven. All rights reserved.
//

#import "SVBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NFirestViewController : SVBaseViewController
@property (nonatomic, assign) BOOL vcCanScroll;
@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
