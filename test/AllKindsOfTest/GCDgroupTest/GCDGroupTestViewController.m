//
//  GCDGroupTestViewController.m
//  test
//
//  Created by sven on 16/12/8.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "GCDGroupTestViewController.h"

@interface GCDGroupTestViewController ()
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation GCDGroupTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    self.title = @"GCD调度组";
}

- (void)demo1 {
    NSLog(@"---");
    dispatch_queue_t queue = dispatch_queue_create("svenaaa", DISPATCH_QUEUE_CONCURRENT);
    
    for (NSInteger i = 0; i < 10; i++) {
        NSURL *url = [NSURL URLWithString:@"https://resource.gximg.cn/a8cac0_1628142249245.png"];
        
        dispatch_async(queue, ^{
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *img = [UIImage imageWithData:data];
            [self.dataArr addObject:img];
        });
        
        if(i == 5){
            NSLog(@"数组个数%zd",self.dataArr.count);
        }
    }
}

- (void)GCDApply {
    dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"%zu",index);
    });
    NSLog(@"done");
    
}

- (void)meituanIntervier {
    __block NSInteger a = 0; //从栈到堆   栈:临时变量; 堆: 可持续的变量
    
    while (a < 10) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            a ++;
//            NSLog(@"线程%@---值%zd",[NSThread currentThread], a);
        });
    }
    
    NSLog(@"外面-->%zd",a);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self dispatchGroup];
//    [self normalDispatchGroupEnterLeave];
//    [self normalUser];
//    [self GCDApply];
    
//    [self meituanIntervier];
    [self demo1];
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

-(NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

@end
