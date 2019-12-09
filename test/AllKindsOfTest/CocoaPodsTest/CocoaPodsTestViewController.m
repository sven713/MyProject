

//
//  CocoaPodsTestViewController.m
//  test
//
//  Created by 宋锡铭 on 2019/12/9.
//  Copyright © 2019 sven. All rights reserved.
//

#import "CocoaPodsTestViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CocoaPodsTestViewController ()

@end

@implementation CocoaPodsTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sdImgTest];
}


- (void)sdImgTest {
    UIImageView *testIv = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:testIv];
    [testIv sd_setImageWithURL:[NSURL URLWithString:@"http://a.hiphotos.baidu.com/image/pic/item/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg"]];
}


@end
