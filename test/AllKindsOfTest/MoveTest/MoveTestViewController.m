//
//  MoveTestViewController.m
//  test
//
//  Created by 宋锡铭 on 2019/3/20.
//  Copyright © 2019 sven. All rights reserved.
//

#import "MoveTestViewController.h"

@interface MoveTestViewController ()
@property (nonatomic, strong) UILabel *moveLb;
@end

@implementation MoveTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    // UIView的动画是没问题的,用label宽度就会突然变化. 
    UIView *label = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, [UIFont systemFontOfSize:20].lineHeight)];
//    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
//    label.text = @"h";
    label.userInteractionEnabled = YES;
    self.moveLb = label;
    label.backgroundColor = [UIColor orangeColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moveLabel)];
    [label addGestureRecognizer:tap];
    
}

- (void)moveLabel {
    
    self.moveLb.frame = CGRectMake(100, 100, 100, [UIFont systemFontOfSize:20].lineHeight);
    [UIView animateWithDuration:0.5 animations:^{
        self.moveLb.frame = CGRectMake(100, 200, 50, [UIFont systemFontOfSize:20].lineHeight);
    }];
}

@end
