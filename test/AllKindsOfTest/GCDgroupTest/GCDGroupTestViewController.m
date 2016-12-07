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
    [self dispatchGroup];
}

- (void)dispatchGroup { // 参考汇桔代码  LYTypeId_14_prodectCtl.h
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [NSThread sleepForTimeInterval:1];
    NSLog(@"第一个耗时任-网络请求");
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    [NSThread sleepForTimeInterval:2];
    NSLog(@"第2222个耗时任-网络请求");
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    [NSThread sleepForTimeInterval:1.5];
    NSLog(@"第333个耗时任-网络请求");
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"三个任务都完成了----");
    });
    
    NSLog(@"到这里了");
}



@end
