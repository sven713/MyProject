//
//  KT_firstViewController.m
//  test
//
//  Created by 宋锡铭 on 2022/9/14.
//  Copyright © 2022 sven. All rights reserved.
//

#import "KT_firstViewController.h"
#import "TestTheread.h"

@interface KT_firstViewController ()

@end

@implementation KT_firstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addView];
}

- (void)addView {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnTap) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnTap{
    TestTheread *thread = [[TestTheread alloc] initWithTarget:self selector:@selector(doSomeThing) object:nil];
    [thread start];
    
    
}

//【题】 线程跟Runloop什么关系？
//答： 源码可见 CFDictionarySetValue(dict, pthreadPointer(_CFMainPThread), mainLoop);， 线程跟Runloop是一一对应的关系。 Runloop的存储方式是键值对，key-value  , key是线程：value:当前线程的runLoop
//
//Demo1 知识点：
//1. 子线程执行完任务会自动销毁，调用了dealloc ✅
//2. 主线程的number是1 ✅
//3. 线程的组成

//runloop为啥会自动销毁? 使用 RunLoop 的目的是让你的线程在有工作的时候忙于工作,而没工作的时候处于休眠状态。 runloop 的设计是为了减少 cpu 无谓的空转。 
//https://www.bilibili.com/video/BV11P4y177ZN?spm_id_from=333.337.search-card.all.click&vd_source=b081b7071b78c55c9a6ff92cc7e1af38


- (void)doSomeThing {
    NSLog(@"线程开始");
    
    NSLog(@"当前线程:%@",[NSThread currentThread]);
    NSLog(@"main线程:%@",[NSThread mainThread]);
    
    [TestTheread sleepForTimeInterval:2];
    
    NSLog(@"END");
}


@end
