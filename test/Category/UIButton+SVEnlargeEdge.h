//
//  UIButton+SVEnlargeEdge.h
//  test
//
//  Created by 宋锡铭 on 2021/7/30.
//  Copyright © 2021 sven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SVEnlargeEdge)


/// 扩大按钮点击范围
/// @param left 左
/// @param top 上
/// @param right 右
/// @param bottom 下
- (void)setLargeLeft:(NSInteger)left top:(NSInteger)top right:(NSInteger)right bottom:(NSInteger)bottom;

@end

NS_ASSUME_NONNULL_END
