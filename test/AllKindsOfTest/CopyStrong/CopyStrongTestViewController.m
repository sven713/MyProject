//
//  CopyStrongTestViewController.m
//  test
//
//  Created by 宋锡铭 on 2021/7/21.
//  Copyright © 2021 sven. All rights reserved.
//

#import "CopyStrongTestViewController.h"

@interface CopyStrongTestViewController ()

//@property (nonatomic, copy) NSString *copyStr;

//@property (nonatomic, strong) NSString * strongStr;

@property (nonatomic, copy) NSString *cStr;

@property (nonatomic, strong) NSString *strongStr;



@property (nonatomic, copy) NSDictionary *dicCopy;

@property (nonatomic, strong) NSDictionary *strongDic;

@property (nonatomic, copy) NSMutableDictionary *mutaDic;

@end

@implementation CopyStrongTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableString *mStr = [NSMutableString stringWithString:@"a"];
    
    
    self.cStr = mStr;
    
    self.strongStr = mStr;
    
    [mStr appendString:@"b"];
    
    NSLog(@"cStr:%@--strong:%@",self.cStr, self.strongStr); // cStr是a, strongStr是ab
    
    //HTTP VS HTTPS
    //11:36-41   超文本传输协议, s是安全版本
    //端口   443   80
    // SSL  包含身份认证, ;  简单链接,无状态
    // 加密传输;  明文传输
    // 证书收费,免费
    
    
    [self dicTest];
}


- (void)dicTest { // 2:00
    
//    @property (copy) NSDictionary *dicCopy; // 外部变化,不会变

//    @property (strong) NSDictionary *strongDic; // 外部变化,会变
    
//    @property (copy) NSMutableDictionary *mutaDic; // 外部变化, 不会变
    
    NSLog(@"-------------------------------");
    NSDictionary *dic = @{
        @"key1":@"1",
        @"key2":@"2",
    };
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    
    self.dicCopy = mDic;
    self.strongDic = mDic;
    self.mutaDic = mDic;
    
    [mDic setValue:@"99" forKey:@"key1"];
    
    NSLog(@"copyDic:%@--strongDic:%@--mutDic:%@",self.dicCopy, self.strongDic,self.mutaDic);
}

@end
