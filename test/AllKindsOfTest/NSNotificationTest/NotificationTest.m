//
//  NotificationTest.m
//  test
//
//  Created by song ximing on 2016/11/28.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "NotificationTest.h"

@implementation NotificationTest

- (id)init
{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test) name:@"removeTest" object:nil];
    }
    return self;
}

- (void)test
{
    NSLog(@"=======---VVVV-----======");
}

- (void)dealloc
{
    NSLog(@"NotificationTest被释放了");
    
}

@end
