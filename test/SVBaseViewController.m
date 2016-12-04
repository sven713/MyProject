//
//  SVBaseViewController.m
//  test
//
//  Created by sven on 16/11/9.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVBaseViewController.h"

@interface SVBaseViewController ()

@end

@implementation SVBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"当前进入的控制器:%@",[[self class] description]);
}

- (void)dealloc {
    NSLog(@"控制器类得到正常释放了:%@",[[self class] description]);
}

@end
