//
//  AnimateTestViewController.m
//  test
//
//  Created by 宋锡铭 on 2021/7/20.
//  Copyright © 2021 sven. All rights reserved.
//

#import "AnimateTestViewController.h"

@interface AnimateTestViewController ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation AnimateTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self animateTest];
}

- (void)initUI {
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    [self.view addSubview:self.btn];
    self.btn.backgroundColor = [UIColor sv_randomColor];
}

- (void)animateTest {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5), dispatch_get_main_queue(), ^{
        sleep(5); //主线程卡死5s  预测,运动到一半,卡死,5s后再运动
    });
    
    [UIView animateWithDuration:10 animations:^{
        self.btn.left = 100;
    }];
    
    NSLog(@"left:%f", self.btn.left);
    
    
    
}

@end
