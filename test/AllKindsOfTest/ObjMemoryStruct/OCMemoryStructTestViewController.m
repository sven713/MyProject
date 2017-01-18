//
//  OCMemoryStructTestViewController.m
//  test
//
//  Created by song ximing on 2017/1/18.
//  Copyright © 2017年 sven. All rights reserved.
//

#import "OCMemoryStructTestViewController.h"
#import "Child.h"

@interface OCMemoryStructTestViewController ()

@end

@implementation OCMemoryStructTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Child *child = [[Child alloc]init];
    
    [self configUI];
}

- (void)configUI {
    self.title = @"OC的内存结构";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//(Child) $0 = {
//    Father = (_father = 0)
//    _child = 0
//}

//(Child) $0 = {
//    (Father) Father = {
//        (NSObject) NSObject = {
//            (Class) isa = Child // isa指针
//        }
//        (int) _father = 0 // NSObject子类的成员变量 (父类的成员变量)
//    }
//    (int) _child = 0 // NSObject子类的子类的成员变量 (类本身的成员变量)
//}

// http://mp.weixin.qq.com/s/T_rigEMr7hq2_i0GixuubQ  唐桥
@end
