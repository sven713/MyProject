//
//  MutipleDelegateHelper.m
//  test
//
//  Created by 宋锡铭 on 2022/3/3.
//  Copyright © 2022 sven. All rights reserved.
//

#import "MutipleDelegateHelper.h"

@interface MutipleDelegateHelper ()
//@property (nonatomic, strong) NSMutableArray *delegateArr;
@end

@implementation MutipleDelegateHelper



- (void)addDelegate:(id)delegate {
    [self.delegateArr addObject:delegate];
}


-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *sign = [super methodSignatureForSelector:aSelector];
    NSLog(@"1111111111");
    if (sign) {
        return sign;
    }else {
        for (id delegate in self.delegateArr) {
            if ([delegate respondsToSelector:aSelector]) {
                return  [delegate methodSignatureForSelector:aSelector];
            }
        }
    }
    
    return sign;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"22222222");
    
    for(id delegate in self.delegateArr){
        if ([delegate respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:delegate];
        }
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }

    for (id target in self.delegateArr) {
        if ([target respondsToSelector:aSelector]) {
            return YES;
        }
    }

    return NO;
}

-(NSMutableArray *)delegateArr {
    if (!_delegateArr) {
        _delegateArr = [NSMutableArray array];
    }
    return _delegateArr;
}

@end
