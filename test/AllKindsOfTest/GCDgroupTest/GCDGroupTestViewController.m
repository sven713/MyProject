//
//  GCDGroupTestViewController.m
//  test
//
//  Created by sven on 16/12/8.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "GCDGroupTestViewController.h"

@interface GCDGroupTestViewController ()

@end

@implementation GCDGroupTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    self.title = @"GCD调度组";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self dispatchGroup];
    [self normalDispatchGroupEnterLeave];
//    [self normalUser];
}

- (void)dispatchGroup { // 参考汇桔代码  LYTypeId_14_prodectCtl.h
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0); // 两个参数啥意思
    
    dispatch_group_enter(group);
    [NSThread sleepForTimeInterval:3];
    NSLog(@"第一个耗时任-网络请求,--%@",[NSThread currentThread]);
    dispatch_async(globalQueue, ^{ // 并没有开线程!!!!!!都在主线程
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    [NSThread sleepForTimeInterval:2];
    NSLog(@"第2222个耗时任-网络请求,--%@",[NSThread currentThread]);
    dispatch_async(globalQueue, ^{
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    [NSThread sleepForTimeInterval:1.5];
    NSLog(@"第333个耗时任-网络请求,%@",[NSThread currentThread]);
    dispatch_async(globalQueue, ^{
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"三个任务都完成了----%@",[NSThread currentThread]);
    });
    
    NSLog(@"到这里了");
}

/** enter leave */
- (void)normalDispatchGroupEnterLeave {
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    dispatch_group_enter(group);
    dispatch_group_async(group, q, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"第一个耗时任-网络请求--%@",[NSThread currentThread]);
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, q, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"第222个耗时任-网络请求--%@",[NSThread currentThread]);
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, q, ^{
        [NSThread sleepForTimeInterval:1.5];
        NSLog(@"第333个耗时任-网络请求--%@",[NSThread currentThread]);
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{ // 任务都完成了回到主线程
        NSLog(@"三个任务都完成了----%@",[NSThread currentThread]);
    });
    
    NSLog(@"到这里了");
}

- (void)normalUser {
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    
    dispatch_group_async(group, q, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"第一个耗时任-网络请求--%@",[NSThread currentThread]);
        
    });
    
    
    dispatch_group_async(group, q, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"第222个耗时任-网络请求--%@",[NSThread currentThread]);
        
    });
    
    
    dispatch_group_async(group, q, ^{
        [NSThread sleepForTimeInterval:1.5];
        NSLog(@"第333个耗时任-网络请求--%@",[NSThread currentThread]);
        
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{ // 任务都完成了回到主线程
        NSLog(@"三个任务都完成了----%@",[NSThread currentThread]);
    });
    
    NSLog(@"到这里了--没有 enter leave");
}

@end
