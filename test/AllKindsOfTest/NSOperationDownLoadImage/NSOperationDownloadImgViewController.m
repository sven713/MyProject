//
//  NSOperationDownloadImgViewController.m
//  test
//
//  Created by sven on 16/11/20.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "NSOperationDownloadImgViewController.h"

@interface NSOperationDownloadImgViewController ()
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation NSOperationDownloadImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.imgView];
    self.imgView.backgroundColor = [UIColor orangeColor];
    
    UIButton *downLoadBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    downLoadBtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:downLoadBtn];
    [downLoadBtn addTarget:self action:@selector(test1) forControlEvents:UIControlEventTouchUpInside];
    [downLoadBtn setTitle:@"下载图片" forState:UIControlStateNormal];
}

- (void)showBaidu {

}

- (void)test1 {
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                            selector:@selector(downloadImage:)
                                                                              object:@"http://img06.tooopen.com/images/20161112/tooopen_sy_185726882764.jpg"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperation:operation];
}

- (void)downloadImage:(NSString *)url {
    NSURL *nsUrl = [NSURL URLWithString:url];
    NSData *data = [[NSData alloc] initWithContentsOfURL:nsUrl];
    UIImage *image = [[UIImage alloc] initWithData:data];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imgView.image = image;
    });
}

@end
