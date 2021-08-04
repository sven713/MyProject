//
//  WuTableViewCell.h
//  test
//
//  Created by 宋锡铭 on 2021/8/4.
//  Copyright © 2021 sven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WuTableViewCell : UITableViewCell

@property(nonatomic, copy) void (^btnClickBlock)(NSInteger parm);

- (void)configData:(NSInteger)idx;

@end

NS_ASSUME_NONNULL_END
