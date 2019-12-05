


//
//  SVWeakProxy.m
//  test
//
//  Created by 宋锡铭 on 2019/12/4.
//  Copyright © 2019 sven. All rights reserved.
//

#import "SVWeakProxy.h"

@implementation SVWeakProxy

// 消息转发机制???
-(void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

@end
