//
//  NSObject+Leaks.m
//  test
//
//  Created by 宋锡铭 on 2019/12/5.
//  Copyright © 2019 sven. All rights reserved.
//

#import "NSObject+Leaks.h"


@implementation NSObject (Leaks)

- (void)willDealoc {
    
//    __weak typeof(self)weakSelf = self;
    
    __weak id weakSelf = self;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //1秒后还能调用,说明没释放,内存泄漏了,如果对象还存在,弹窗
        __strong id strongSelf = weakSelf;
        if (strongSelf) {
            NSLog(@"泄漏了:%@",NSStringFromClass([strongSelf class]));
        }else {
            NSLog(@"没有内存泄漏");
        }
        
    });
    //TODO:判断是否还存在
}

+ (void)swizzSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL {
    // 获取类的方法
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
    
    // ??????
    BOOL hasAdd = class_addMethod(class, originalSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (hasAdd) {
        class_replaceMethod(class, swizzledSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
