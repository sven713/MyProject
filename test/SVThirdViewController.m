//
//  SVThirdViewController.m
//  test
//
//  Created by sven on 16/11/9.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVThirdViewController.h"
#import "SVPopViewController.h"
#import "UIAlertView+SVBlockAlertView.h"

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
    
    
    UIButton *aleterBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 100)];
    aleterBtn.backgroundColor = [UIColor orangeColor];
    [aleterBtn setTitle:@"带block的alertView" forState:UIControlStateNormal];
    [aleterBtn addTarget:self action:@selector(showBlockAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aleterBtn];
}

- (void)showBlockAlert {

    UIAlertView *alert = [UIAlertView sv_showOKWithTitle:@"svAlert" message:@"svAlert" buttonTitles:@"title" block:^{
      NSLog(@"点击了按钮");
    }];
    
//    UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"hhh" message:@"hhh" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
}


- (void)showPopVC {
    SVPopViewController *vc = [[SVPopViewController alloc]init];
    [vc showInVC:self];
}


@end
