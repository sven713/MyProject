//
//  UIControl+UIControl_SVTouchEventInterval.h
//  test
//
//  Created by sven on 16/11/9.
//  Copyright © 2016年 sven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (UIControl_SVTouchEventInterval)

@property (nonatomic, assign) NSTimeInterval    acceptEventInterval;   //!<重复点击时间间隔

@end
