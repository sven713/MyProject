
//
//  SVLeakTestViewController.m
//  test
//
//  Created by 宋锡铭 on 2019/12/5.
//  Copyright © 2019 sven. All rights reserved.
//

#import "SVLeakTestViewController.h"
#import "UIViewController+Leaks.h"

@interface SVLeakTestViewController ()
@property (nonatomic, copy) void(^testBlock)(void);
@end

@implementation SVLeakTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self leakTest];
}


- (void)leakTest {
    self.testBlock = ^(){
//        self.view.backgroundColor = [UIColor orangeColor];
    };
}

-(void)dealloc {
    NSLog(@"leak正常释放了");
}

/**
 目标:监听内存泄漏(push,pop)
 思路:控制器出栈,视图完全消失,监听对象是否活着;活着:泄漏了;死了,没泄漏
 步骤:
 1.使用Runtime交换方法viewWillAppear viewDidDisappear
 2.使用关联对象获取进出栈状态
 3.界面完全消失,出栈状态,观察对象是否存活
 */

@end
