//
//  Node.m
//  test
//
//  Created by 宋锡铭 on 2020/5/28.
//  Copyright © 2020 sven. All rights reserved.
//

#import "ListNode.h"

@interface ListNode()

@end

@implementation ListNode
-(instancetype)initWithElement:(int)element {
    if (self = [super init]) { //初始化方法都不会写啦
        _value = element;
        _next = nil; //TODO:  NULL nil NSNULL
    }
    return  self;
}


- (NSString *)description{
    return [NSString stringWithFormat:@"ListNode值:%d\n",self.value];
}
@end
