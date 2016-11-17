//
//  TouchEventTestViewController.m
//  test
//
//  Created by sven on 16/11/17.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "TouchEventTestViewController.h"

@interface TouchEventTestViewController ()

@end

@implementation TouchEventTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    self.title = @"响应点击事件test";
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 300, 200)];
    [self.view addSubview:containerView];
    containerView.backgroundColor = [UIColor greenColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(containerViewClick)];
    [containerView addGestureRecognizer:tap];
    containerView.userInteractionEnabled = YES;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 30, 200, 100)];
    btn.backgroundColor = [UIColor orangeColor];
    [containerView addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)containerViewClick {
    NSLog(@"containerView被点击了");
}

- (void)btnClick {
    NSLog(@"ben被点击了");
}

@end
