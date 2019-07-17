//
//  NContentTableViewCell.h
//  test
//
//  Created by 宋锡铭 on 2019/5/14.
//  Copyright © 2019 sven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**容器*/
@interface NContentTableViewCell : UITableViewCell
- (void)configVCArray:(NSArray *)arr;

@property (nonatomic, assign) BOOL cellCanScroll;

@end

NS_ASSUME_NONNULL_END
