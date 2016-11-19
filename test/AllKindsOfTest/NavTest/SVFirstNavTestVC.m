//
//  SVFirstNavTestVC.m
//  test
//
//  Created by sven on 16/11/15.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVFirstNavTestVC.h"
#import "SVSecondNavTestVC.h"

@implementation SVFirstNavTestVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    self.title = @"导航栏测试 第一个控制器";
    self.view.backgroundColor = [UIColor brownColor]; // 不设置控制器View背景颜色,滑动手势不能返回
    
    // 带参数,带返回值的block
    NSString *(^stringBlock)(BOOL) = ^(BOOL aaa){
        return [NSString stringWithFormat:@"参数是%d--返回值是字符串的blcok",aaa];
    };
    NSLog(@"-%@",stringBlock(YES));
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"去第二个控制器" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn addTarget:self action:@selector(showSecondVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)showSecondVC {
    SVSecondNavTestVC *vc = [SVSecondNavTestVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
