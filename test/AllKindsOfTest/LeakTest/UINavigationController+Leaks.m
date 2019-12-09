//
//  UINavigationController+Leaks.m
//  test
//
//  Created by 宋锡铭 on 2019/12/6.
//  Copyright © 2019 sven. All rights reserved.
//

#import "UINavigationController+Leaks.h"
#import "NSObject+Leaks.h"
//#import "UIViewController+Leaks.h"

@implementation UINavigationController (Leaks)

+(void)load {

    [self swizzSEL:@selector(popViewControllerAnimated:) withSEL:@selector(swizzedPopViewControllerAnimated:)];
}


-(UIViewController *)swizzedPopViewControllerAnimated:(BOOL)animated {
    UIViewController *vc = [self swizzedPopViewControllerAnimated:animated];
    
    extern const void* kHasPoped;
    
    objc_setAssociatedObject(vc, kHasPoped, @(YES), OBJC_ASSOCIATION_RETAIN);
    
    return vc;
}

@end
