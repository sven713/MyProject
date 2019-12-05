//
//  TextBlurViewController.m
//  test
//
//  Created by 宋锡铭 on 2019/11/14.
//  Copyright © 2019 sven. All rights reserved.
//

#import "TextBlurViewController.h"
#import "YYWeakProxy.h"
#import "SVWeakProxy.h"

@interface TextBlurViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) id target;
@property (nonatomic, strong) SVWeakProxy *weakP;
@end

@implementation TextBlurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    pushBtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:pushBtn];
    [pushBtn addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    
    // 内存泄漏
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    // 内存泄漏
//    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    // pop不会内存泄漏
//    YYWeakProxy *proxy = [YYWeakProxy proxyWithTarget:self];
//    self.timer = [NSTimer timerWithTimeInterval:1 target:proxy selector:@selector(timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    // 使用运行时添加方法也可以避免强引用造成的内存泄漏
//    self.target = [NSObject new];
//    class_addMethod([self.target class], @selector(timerAction), (IMP)targetAction, "v@:");
//    self.timer = [NSTimer timerWithTimeInterval:1 target:self.target selector:@selector(timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    //运行崩溃
    
    self.weakP = [SVWeakProxy alloc];
    self.weakP.target = self;
    self.timer = [NSTimer timerWithTimeInterval:1 target:self.weakP selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];

}

void targetAction(id self, SEL _cmd){
    NSLog(@"转发---");
}

- (void)timerAction {
    NSLog(@"调用timer");
}

-(void)viewDidDisappear:(BOOL)animated {
//    [self.timer invalidate];
//    self.timer = nil;
}

- (void)dealloc {
    NSLog(@"释放了");
    [self.timer invalidate];
    self.timer = nil;
}

- (void)pushAction{
    UIViewController *vc = [UIViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    vc.view.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)addNumber:(NSInteger)number1 number2:(NSInteger)number2 {
    return number1 + number2;
}

-(void)viewWillAppear:(BOOL)animated {}

//-(void)viewWillAppear:(NSString *)animated {}

+ (void)viewWillAppear:(BOOL)animated {}


@end
