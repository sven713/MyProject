//
//  AutoLayoutViewController.m
//  test
//
//  Created by 宋锡铭 on 2021/7/27.
//  Copyright © 2021 sven. All rights reserved.
//

#import "AutoLayoutViewController.h"
//#import "Masonry.h"

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self autoLayoutTest];
}

- (void)autoLayoutTest {
    //设置frame就不能用自动布局
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor sv_randomColor];
    label.text = @"内容内容内容";
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.top.mas_equalTo(500);
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
