//
//  NSObject+Delegates.m
//  test
//
//  Created by 宋锡铭 on 2022/3/3.
//  Copyright © 2022 sven. All rights reserved.
//

#import "NSObject+Delegates.h"

@implementation NSObject (Delegates)

-(void)setMutipleDelegatesHelper:(MutipleDelegateHelper *)mutipleDelegatesHelper {
    objc_setAssociatedObject(self, @selector(mutipleDelegatesHelper), mutipleDelegatesHelper, OBJC_ASSOCIATION_RETAIN);
}

-(MutipleDelegateHelper *)mutipleDelegatesHelper {
//    const void * key = @"MutipleDelegateHelperKey";
//    return objc_getAssociatedObject(self, key);
    
    
    MutipleDelegateHelper *multiDelegate = objc_getAssociatedObject(self,@selector(mutipleDelegatesHelper));
    if(multiDelegate == nil)
    {
        multiDelegate = [[MutipleDelegateHelper alloc]init];
        objc_setAssociatedObject(self, @selector(mutipleDelegatesHelper), multiDelegate, OBJC_ASSOCIATION_RETAIN);
    }
    return multiDelegate;
}

@end
