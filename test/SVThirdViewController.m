//
//  SVThirdViewController.m
//  test
//
//  Created by sven on 16/11/9.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVThirdViewController.h"
#import "SVPopViewController.h"

@interface SVThirdViewController ()

@end

@implementation SVThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    self.title = @"第三个控制器";
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.view.backgroundColor = [UIColor brownColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"弹出popVC" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showPopVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}



- (void)showPopVC {
    SVPopViewController *vc = [[SVPopViewController alloc]init];
    [vc showInVC:self];
}


@end
