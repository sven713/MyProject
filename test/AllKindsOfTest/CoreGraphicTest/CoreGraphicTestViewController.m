//
//  CoreGraphicTestViewController.m
//  test
//
//  Created by sven on 16/11/19.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "CoreGraphicTestViewController.h"
#import "CoreGraphicView.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface CoreGraphicTestViewController ()

@end

@implementation CoreGraphicTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    self.title = @"Core Graphic";
    
    CoreGraphicView *view = [[CoreGraphicView alloc]initWithFrame:CGRectMake(0, 68, kScreenW, kScreenH)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
//    [self drawRectangle];
}

// 绘制矩形
- (void)drawRectangle {
    
    // 定义矩形的rect
    CGRect rectangle = CGRectMake(100, 290, 120, 25);
    
    // 获取当前图形，视图推入堆栈的图形，相当于你所要绘制图形的图纸
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 在当前路径下添加一个矩形路径
    CGContextAddRect(ctx, rectangle);
    
    // 设置试图的当前填充色
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    
    // 绘制当前路径区域
    CGContextFillPath(ctx);
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    [self drawRectangle];
}

@end
