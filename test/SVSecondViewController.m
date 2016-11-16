//
//  SVSecondViewController.m
//  test
//
//  Created by sven on 16/11/9.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVSecondViewController.h"
#import "UIControl+UIControl_SVTouchEventInterval.h"
#import "SVThirdViewController.h"
#import "SVTableViewCellHeightAutoTestVC.h"

@interface SVSecondViewController ()
@property (nonatomic, strong) UIButton *showTableVeiw;
@end

@implementation SVSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    self.view.backgroundColor = [UIColor brownColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.acceptEventInterval = 0.5;

    self.showTableVeiw = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:self.showTableVeiw];
    [self.showTableVeiw setTitle:@"自动计算cell高度" forState:UIControlStateNormal];
    [self.showTableVeiw addTarget:self action:@selector(showTableView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextVC {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        SVThirdViewController *vc = [SVThirdViewController new];
    
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
//    });
}

- (void)showTableView {
    SVTableViewCellHeightAutoTestVC *vc = [[SVTableViewCellHeightAutoTestVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
