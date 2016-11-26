//
//  NSNotificatinoTestViewController.m
//  test
//
//  Created by song ximing on 2016/11/26.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "NSNotificatinoTestViewController.h"

@interface NSNotificatinoTestViewController ()

@end

@implementation NSNotificatinoTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}
- (void)configUI {
    self.title = @"通知测试";
    // 最后一个参数 可以指定textField,不监听所有的textfield,只监听当前页面里面的textField的改变  http://www.jianshu.com/p/a2cb99dcd4fe
    // http://www.cnblogs.com/xunziji/p/3257447.html
    // http://www.jianshu.com/p/a4d519e4e0d5
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:nil object:nil]; // name为nil 监听所有的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationTest" object:nil];
}

- (void)handleNotification:(NSNotification *)notice {
    NSLog(@"notice.name--%@",notice.name); // 打印了各种通知
}

@end
