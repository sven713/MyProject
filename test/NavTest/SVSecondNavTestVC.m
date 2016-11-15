//
//  SVSecondNavTestVC.m
//  test
//
//  Created by sven on 16/11/15.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVSecondNavTestVC.h"
#import "SVThirdNavTestVC.h"

@implementation SVSecondNavTestVC
-(void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    self.title = @"22222";
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"去第三个控制器" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn addTarget:self action:@selector(showThirdVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *popBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    popBtn.backgroundColor = [UIColor orangeColor];
    [popBtn addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popBtn];
}

- (void)popAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showThirdVC {
    SVThirdNavTestVC *vc = [SVThirdNavTestVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO; // 在这设置禁用滑动返回会,从下一个页面返回会卡死 因为从下一页面返回到这个页面的时候,这个页面还没展现出来也会先调用willAppear,这里设置成不能滑动返回,然而从第三个页面回到这个页面的动画还没做完,所以就停住了,卡死了, 写在viewDidAppear就没问题,因为这个返回动画做完了才把这个可滑动返回置为no的
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


@end
