//
//  UIButton+Spring.h
//  test
//
//  Created by 宋锡铭 on 2021/7/30.
//  Copyright © 2021 sven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// runtime添加按钮点击动效
@interface UIButton (Spring)
@property (nonatomic, assign) BOOL isSpring;
@end

NS_ASSUME_NONNULL_END
