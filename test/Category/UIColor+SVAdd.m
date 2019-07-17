//
//  UIColor+SVAdd.m
//  YoungAPP
//
//  Created by 宋锡铭 on 2019/3/7.
//  Copyright © 2019 秦智博. All rights reserved.
//

#import "UIColor+SVAdd.h"

@implementation UIColor (SVAdd)


+ (UIColor *)sv_randomColor {
    CGFloat red = ( arc4random() % 255 / 255.0 );
    CGFloat green = ( arc4random() % 255 / 255.0 );
    CGFloat blue = ( arc4random() % 255 / 255.0 );
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
