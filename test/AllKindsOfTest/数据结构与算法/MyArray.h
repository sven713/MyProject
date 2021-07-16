//
//  MyArray.h
//  algo
//
//  Created by Wenru Dong on 2018/10/3.
//  Copyright © 2018年 Wenru Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyArray : NSObject

- (instancetype)initWithCapacity:(NSUInteger)capacity;
- (id)objectAtIndexedSubscript:(NSUInteger)index; //根据下标取元素?
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)addObject:(id)anObject;
- (void)printAll;
@end
