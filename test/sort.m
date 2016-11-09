//
//  sort.m
//  test
//
//  Created by sven on 16/11/7.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "sort.h"

@implementation sort // 24


- (instancetype)initWithArr:(NSArray *)arr {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)newSort:(NSMutableArray *)arr left:(NSInteger)left right:(NSInteger)right {
    if (left >= right) {
        return;
    }
    
    NSInteger i = left;
    NSInteger j = right;
    
    NSInteger point = [arr[left] integerValue];
    
    while (i != j) {
        while (i < j && point <= [arr[j] integerValue]) {
            j --;
        }
        
        while (i < j && point >= [arr[i] integerValue]) {
            i ++;
        }
        
        if (i < j) { // <=????
            [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
    
    [arr exchangeObjectAtIndex:i withObjectAtIndex:left];
    
    [self newSort:arr left:left right:i - 1];
    [self newSort:arr left:i + 1 right:right];
}

@end
