//
//  SVPopViewController.m
//  test
//
//  Created by sven on 16/11/13.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVPopViewController.h"
#import <objc/runtime.h>

@interface SVPopViewController ()
@property (weak, nonatomic) UIViewController *fromViewController;
@end

static const void *hdf_seeDoctorPopupViewControllerKey = "hdf_seeDoctorPopupViewController";

@implementation SVPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(300, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"关闭dismiss" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap];
}

- (void)showInVC:(UIViewController *)viewController {
    self.view.backgroundColor = [UIColor greenColor];
    self.view.alpha = 0.5;
    self.view.frame = [UIApplication sharedApplication].keyWindow.bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:self.view];
    
    // 不调用这个方法, dismiss不走  Dealloc了 没有关联的东西  why??
    objc_setAssociatedObject(viewController, // 可以写@"s";写啥都行
                             hdf_seeDoctorPopupViewControllerKey,
                             self,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)dismiss {
    [self.view removeFromSuperview];
}

@end
