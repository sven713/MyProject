//
//  SVAFNTestViewController.m
//  test
//
//  Created by song ximing on 2017/4/28.
//  Copyright © 2017年 sven. All rights reserved.
//

#import "SVAFNTestViewController.h"

@interface SVAFNTestViewController ()
@property (nonatomic, strong) UILabel *resultLb;
@end

@implementation SVAFNTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    [self initUI];
}

- (void)initUI {
    self.title = @"AFNTest";
    
    self.resultLb = [UILabel new];
    [self.view addSubview:self.resultLb];
    [self.resultLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
}

- (void)requestData {
    [[AFHTTPSessionManager manager]GET:@"http://ip.taobao.com/service/getIpInfo.php?ip=117.89.35.58" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dict = responseObject;
        NSDictionary *data = [dict objectForKey:@"data"];
        NSString *city = [data objectForKey:@"city"];
        self.resultLb.text = city;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
