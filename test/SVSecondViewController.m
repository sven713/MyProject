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

@interface SVSecondViewController ()
@property (nonatomic, strong) UIImageView *imageView;
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

    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.imageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_imageView];
    [self downloadImage:@"https://img4.imgtn.bdimg.com/it/u=1249439673,470705047&fm=21&gp=0.jpg"];

}

- (void)nextVC {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        SVThirdViewController *vc = [SVThirdViewController new];
    
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
//    });
}

- (void)downloadImage:(NSString *)url {
    NSURL *nsUrl = [NSURL URLWithString:url];
    NSData *data = [[NSData alloc] initWithContentsOfURL:nsUrl]; // nil
    UIImage *image = [[UIImage alloc] initWithData:data];
    __weak typeof (self) weakSelf = self;
//    dispatch_async(dispatch_get_main_queue(), ^{
        _imageView.image = image;
//    });
}

@end
