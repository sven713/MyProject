//
//  MutipleDelegate3_4_2022.m
//  test
//
//  Created by 宋锡铭 on 2022/3/4.
//  Copyright © 2022 sven. All rights reserved.
//

#import "MutipleDelegate3_4_2022.h"

@implementation MutipleDelegate3_4_2022


-(BOOL)respondsToSelector:(SEL)aSelector {

    // 如果父类能响应, 直接返回yes
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    
    // 遍历,让代理响应
    for (id delegate in self.delegates) {
        if ([delegate respondsToSelector:aSelector]) {
            return YES;
        }
    }
    
    
    return  NO;
}


-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *sign = [super methodSignatureForSelector:aSelector];
    if (sign) {
        return  sign;
    }else {
        // 每个代理都生成sign
        for(id delegate in self.delegates){
            if ([delegate respondsToSelector:aSelector]) {
                
                // 下面这行没写对,写成了 sign = [delegate methodSignatureForSelector:aSelector];
                return [delegate methodSignatureForSelector:aSelector];
                
            }
        }
        return  sign;
    }
}


- (void)forwardInvocation:(NSInvocation *)anInvocation {
    for(id delegate in self.delegates){
        if ([delegate respondsToSelector:anInvocation.selector]) {
//            [delegate forwardInvocation:anInvocation];
            // 下面这句没抄对. 意思是, anInvocation调用delegate
            [anInvocation invokeWithTarget:delegate];
        }
    }
}


-(NSMutableArray *)delegates {
    if (!_delegates) {
        _delegates = [NSMutableArray array];
    }
    return _delegates;
}

@end
