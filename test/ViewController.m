//
//  ViewController.m
//  test
//
//  Created by sven on 16/10/26.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "ViewController.h"
#import "SVProtocalView.h"
#import "sort.h"

typedef int(cBlock)(BOOL x);
//typedef NSString *(bBlock)(int, BOOL);
typedef NSString *(bBlock)(int, BOOL);

static NSString *str = @"哈哈哈";

@interface ViewController ()<SVProtocalViewDelegate>
@property (nonatomic, strong)SVProtocalView *svview;

@property (strong, nonatomic) NSArray *bookArray1;
@property (copy, nonatomic) NSArray *bookArray2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.svview.delegate = self;
    NSLog(@"%s",__func__);
    self.view.backgroundColor = [UIColor orangeColor];
    
    
//    NSLog(@"1");
//    dispatch_sync(dispatch_get_main_queue(), ^{ // sync同步 main串行
//        // 同步,异步--线程 同步-主线程
//        // main_queue global_queue 串行队列,并发队列
//        // 先进先出 3先进的,2后进的,应该先走外面的,但是同步要求
//        // 先进先出,任务3先,任务2最后加入队列的,先进先出,等任务3执行,但是任务2是同步任务,
////        dispatch_get_global
//        NSLog(@"2");
//    });
//    NSLog(@"3");
    
//    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
//    
//    NSLog(@"1"); // 任务1
//    
//    dispatch_async(queue, ^{
//        
//        NSLog(@"2"); // 任务2
//        
//        dispatch_sync(queue, ^{
//            
//            NSLog(@"3"); // 任务3
//            
//        });
//        
//        NSLog(@"4"); // 任务4
//        
//    });
//    
//    NSLog(@"5"); // 任务5
    
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        
//        NSLog(@"1"); // 任务1
//        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            
//            NSLog(@"2"); // 任务2
//            
//        });
//        
//        NSLog(@"3"); // 任务3
//        
//    });
//    
//    NSLog(@"4"); // 任务4
    
//    while (1) {
//        
//    }
    
//    NSLog(@"5"); // 任务5
    
//    int (^aBlock)(NSString *) = ^(NSString *a) {
//        return 3;
//    };
    
    
    [self GCD2];
    
    int (^aBlock)(BOOL a) = ^(BOOL a){return 3;};
    
    NSMutableArray *array = [NSMutableArray array];
    
    //int x = arc4random() % 100;---- 表示 [0, 100)
    static int num = 100;
    for (int i = 0;i < num; i++) {
        u_int32_t x = arc4random() % num;
        NSNumber *num = [[NSNumber alloc] initWithInt:x];
        [array addObject:num];
    }
    
//    [self sort:array left:0 right:array.count - 1]; // 快排
//    [self selectSort:array]; // 选择排序
//    [self bubleSort:array]; // 冒泡排序
    
//    SVProtocalView *view = [SVProtocalView new];
//    [view sortQuick:array left:0 right:array.count - 1];
    
//    [self newSort:array left:0 right:array.count - 1];
//    [self noonSort:array left:0 right:array.count - 1];
//    NSLog(@"%@",array);
    
//    NSMutableArray *books = [@[@"book1"] mutableCopy];
//    
//    self.bookArray1 = books;
//    self.bookArray2 = books;
//    [books addObject:@"book2"];
//    NSLog(@"bookArray1:%@",self.bookArray1);
//    NSLog(@"bookArray2:%@",self.bookArray2);
}

- (void)SVProtocalView:(SVProtocalView *)SVProtocalView logMSG:(NSString *)msg {

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

//-(void)str:(NSString *)str block:(BOOL(^)(int a))block {
//
//}
//
//- (void)str:(NSString *)str ablock:(cBlock)block {
//
//}

-(void)str:(NSString *)str block:(int(^)(BOOL))block {
}

- (void)sort:(NSMutableArray *)arr left:(NSInteger)left right:(NSInteger)right {
    if (left >= right) {
        return;
    }
    NSInteger i = left;
    NSInteger j = right;
    NSInteger point = [arr[left] integerValue];
    while(i != j){
        while (i < j && point <= [arr[j] integerValue]) {
            j --;
        }
        while (i < j && point >= [arr[i] integerValue]) {
            i ++;
        }
        if (i < j) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
    [arr exchangeObjectAtIndex:i withObjectAtIndex:left]; // i++变化了
    [self sort:arr left:left right:i - 1];
    [self sort:arr left:i + 1 right:right];
}

- (void)selectSort:(NSMutableArray *)arr { // i j比较
    for (int i = 0 ; i < arr.count; i ++) {
        for (int j = i+1; j < arr.count; j++) {
            NSInteger temp = [arr[i] integerValue];
            if (arr[i] >= arr[j]) {
                arr[i] = arr[j];
                arr[j] = [NSNumber numberWithInteger:temp];
            }
        }
    }
    NSLog(@"选择排序-%@",arr);
}

- (void)bubleSort:(NSMutableArray *)arr{ // j j 比较
    for (int i = 0; i < arr.count; i ++) {
        for (int j = 0; j < arr.count - 1; j++) {
            if (arr[j] >= arr[j+1]) {
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    NSLog(@"冒泡排序-%@",arr);
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
    NSLog(@"newSort--->%@",arr);
}

- (void)noonSort:(NSMutableArray *)arr left:(NSInteger)left right:(NSInteger)right {
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
        if (i < j) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
    [arr exchangeObjectAtIndex:i withObjectAtIndex:left];
    [self noonSort:arr left:left right:i - 1];
    [self noonSort:arr left:i + 1 right:right];
    NSLog(@"noonSort--%@",arr);
}

- (void)GCD2 {
    NSLog(@"1");
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"2"); // 不会锁死
    });
    dispatch_sync(queue, ^{
        NSLog(@"3");
    });
}

- (void)GCD4 {
    NSLog(@"1");
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2"); // 会锁死
    });
    NSLog(@"3");
}

@end
