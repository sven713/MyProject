//
//  NSNotificatinoTestViewController.m
//  test
//
//  Created by song ximing on 2016/11/26.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "NSNotificatinoTestViewController.h"
#import "NSNotificationCenter+remove.h"

@interface Observer : NSObject

@property (nonatomic, assign) NSInteger i;
@property (nonatomic, weak) id<NSObject> observer;

@end

@implementation Observer

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        NSLog(@"Init Observer");
        __weak typeof (self)weakSelf = self;
        // 添加观察者
        _observer =  [[NSNotificationCenter defaultCenter] addObserverForName:@"TEST_NOTIFICATION" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
            
            NSLog(@"handle notification");
            
            // 使用self 会造成循环引用,dealloc永远不走,这个类对应的对象一直不能被释放,内存泄漏
            weakSelf.i = 10;
        }];
    }
    
    return self;
}

-(void)dealloc {
    NSLog(@"observe被释放了");
}

@end

@interface NSNotificatinoTestViewController ()

@end

@implementation NSNotificatinoTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}
- (void)configUI {
    self.title = @"通知测试";
    // http://www.cnblogs.com/xunziji/p/3257447.html
    // http://www.jianshu.com/p/a4d519e4e0d5
    // 最后一个参数 可以指定textField,不监听所有的textfield,只监听当前页面里面的textField的改变  http://www.jianshu.com/p/a2cb99dcd4fe done
    // 最后一个参数可以指定接收哪个观察者发送的消息!!!!! object
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:nil object:nil]; // name为nil 监听所有的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationTest" object:nil];
    
    [self mutipleThreadWithNotification];
    
//    Observer *observe = [[Observer alloc]init]; // 先创建观察者
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TEST_NOTIFICATION" object:nil]; // 测试block循环引用
}

- (void)handleNotification:(NSNotification *)notice {
//    NSLog(@"notice.name--%@",notice.name); // 打印了各种通知
}

// 通知在多线程
- (void)mutipleThreadWithNotification {
    // 主线程添加观察者
    // Q:线程和队列？？
    // 直接带block回调的观察者
    [[NSNotificationCenter defaultCenter] addObserverForName:@"kBlockNotification" object:self queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"recieve--currentThread--%@",[NSThread currentThread]); // [NSOperationQueue mainQueue] 打印线程为主线程， queue写nil打印线程为通知发出的线程， 【总结】：如果不指定观察的线程，那么在哪个线程发送的广播，就在哪个线程响应广播，串行的，博客里说同步
        // 同步跟串行  异步跟并发
        // 异步表示开子线程， 并发表示同时执行几个任务
        // 串行是按顺序执行的，同步呢?也是按顺序执行的？
        // 串行并行针对队列queue
        // 异步一定会开启新的线程
        // http://blog.ximu.site/gcd/     http://www.cnblogs.com/hrios/p/thr.html   多线程
    }];
    // 子线程发出通知
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"post--currentThread--%@",[NSThread currentThread]); // 先Receive 然后 post 写在发送之后
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kBlockNotification" object:self];
    });
}

@end
// NSNotification的移除: 1.在dealloc里面 2.可以单个移除
// 如果不移除 不会崩溃 那不移除 有啥问题么? 好像没啥问题,ARC下系统自动帮我们把通知移除了, 通过给notificatino写个分类,重写remove方法
