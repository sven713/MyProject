
//
//  UIViewController+Leaks.m
//  test
//
//  Created by 宋锡铭 on 2019/12/6.
//  Copyright © 2019 sven. All rights reserved.
//

#import "UIViewController+Leaks.h"
#import "NSObject+Leaks.h"

const void * kHasPoped = "kHasPoped";

@implementation UIViewController (Leaks)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzSEL:@selector(viewWillAppear:) withSEL:@selector(swizzedViewWillAppear:)];
        [self swizzSEL:@selector(viewDidDisappear:) withSEL:@selector(swizzedViewDidDisappear:)];
//        [self swizzSEL:NSSelectorFromString(@"dealloc") withSEL:@selector(swizzedDealloc)];
    });
    

}

- (void)swizzedViewWillAppear:(BOOL)animated {
    
    [self swizzedViewWillAppear:animated];
    
    objc_setAssociatedObject(self, kHasPoped, @(NO), OBJC_ASSOCIATION_RETAIN);
    //入栈状态
}

- (void)swizzedViewDidDisappear:(BOOL)animated {
    [self swizzedViewDidDisappear:animated]; //调用自身
    BOOL result = [objc_getAssociatedObject(self, kHasPoped) boolValue];
    NSLog(@"结果L:%d",result);
    if ([objc_getAssociatedObject(self, kHasPoped) boolValue]) {
        [self willDealoc];
    }
}

-(void)swizzedDealloc {
    [self swizzedDealloc];
    objc_setAssociatedObject(self, kHasPoped, @(YES), OBJC_ASSOCIATION_RETAIN);
}

//-(void)dealloc

@end
