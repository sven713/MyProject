//
//  SVFirstViewController.m
//  test
//
//  Created by sven on 16/11/9.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVFirstViewController.h"
#import "SVFirstNavTestVC.h"

@interface SVFirstViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation SVFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    [self initUI];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self downloadImage:@"https://img4.imgtn.bdimg.com/it/u=1249439673,470705047&fm=21&gp=0.jpg"];
}

- (void)initUI {
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"NSOperation" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(NSOperationTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.imageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.imageView];
    [self downloadImage:@"https://img4.imgtn.bdimg.com/it/u=1249439673,470705047&fm=21&gp=0.jpg"];
    
    UIButton *navBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 500, 100, 100)];
    navBtn.backgroundColor = [UIColor orangeColor];
    [navBtn setTitle:@"导航栏测试" forState:UIControlStateNormal];
    [self.view addSubview:navBtn];
    [navBtn addTarget:self action:@selector(showNavTestVC) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showNavTestVC {
    SVFirstNavTestVC *vc = [SVFirstNavTestVC new];
    vc.hidesBottomBarWhenPushed = YES; // 这个写push后面不能隐藏
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)NSOperationTest {
//    NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(downLoadImage:) object:@"https://img4.imgtn.bdimg.com/it/u=1249439673,470705047&fm=21&gp=0.jpg"];
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    [queue addOperation:op]; // 异步操作
    
//    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
//                                                                            selector:@selector(downLoadImage:)
//                                                                              object:@"https://img4.imgtn.bdimg.com/it/u=1249439673,470705047&fm=21&gp=0.jpg"];
    
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    [queue addOperation:operation];

//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:operation];
//    dispatch_queue_t globalQueue = dispatch_queue_create("yiBu", NULL);
//    dispatch_async(globalQueue, ^{
//        [self downLoadImage:@"https://img4.imgtn.bdimg.com/it/u=1249439673,470705047&fm=21&gp=0.jpg"];
//    });
}

//- (void)downLoadImage:(NSString *)url {
//    NSURL *url1 = [NSURL URLWithString:url];
//    NSData *data = [[NSData alloc]initWithContentsOfURL:url1];
//    UIImage *image = [UIImage imageWithData:data];
//    __weak typeof (self) weakSelf = self;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        weakSelf.imageView.image = image;
//    });
//    
////    NSURL *nsUrl = [NSURL URLWithString:url];
////    NSData *data = [[NSData alloc] initWithContentsOfURL:nsUrl];
////    UIImage *image = [[UIImage alloc] initWithData:data];
////    
////    dispatch_async(dispatch_get_main_queue(), ^{
////        self.imageView.image = image;
////    });
//}

- (void)downloadImage:(NSString *)url {
    NSURL *nsUrl = [NSURL URLWithString:url];
    NSData *data = [[NSData alloc] initWithContentsOfURL:nsUrl];
    UIImage *image = [[UIImage alloc] initWithData:data];
    __weak typeof (self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.imageView.image = image;
    });
}

@end
