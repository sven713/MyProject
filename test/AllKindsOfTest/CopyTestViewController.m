//
//  CopyTestViewController.m
//  test
//
//  Created by 宋锡铭 on 2021/7/20.
//  Copyright © 2021 sven. All rights reserved.
//

#import "CopyTestViewController.h"

@interface CopyTestViewController ()
@property (nonatomic, strong) NSArray *bookArrStrong;
@property (nonatomic, copy) NSArray *bookArrCopy;
@end

@implementation CopyTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self copyTest];
    [self test2];
}


-(void)copyTest {
    NSArray *books = @[@"a", @"b"]; // a
    
    self.bookArrStrong = books; // b
    
    self.bookArrCopy = books; // c   预测: a == c   b跟a不同
    
    NSLog(@"原始:%p",books);
    
    NSLog(@"stro:%p", self.bookArrStrong);
    
    NSLog(@"copy:%p", self.bookArrCopy);
    
    // 测试结果, books,self.bookArrStrong,self.bookArrCopy地址一样!!!!被忽悠了
}

- (void)test2 {
    NSMutableArray *books = [NSMutableArray arrayWithArray:@[@"a", @"b"]];
    NSArray *books2 = [books copy];
    
    // 预测:深拷贝,books跟books2地址不同
    
    NSLog(@"books:%p \n book2:%p",books, books2);
    
}

@end
