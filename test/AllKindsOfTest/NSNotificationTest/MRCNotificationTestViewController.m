//
//  MRCNotificationTestViewController.m
//  test
//
//  Created by song ximing on 2016/11/27.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "MRCNotificationTestViewController.h"
#import <objc/runtime.h>

@interface MRCNewObject : NSObject

@end
@implementation MRCNewObject

- (id)init
{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test) name:@"removeTest" object:nil];
    }
    return self;
}

- (void)test
{
    NSLog(@"=================");
}

- (void)dealloc
{
    [super dealloc];
    NSLog(@"MRCObject被释放了");
    
//    Method a = class_getInstanceMethod([self class], @selector(removeObserver:));
//    Method b = class_getInstanceMethod([self class], @selector(removeCall:));
//    method_exchangeImplementations(a, b);
}

- (void)removeCall:(id)observe {
    NSLog(@"调用了removeObserve方法--%@",[observe class]);
}

@end


@interface MRCNotificationTestViewController ()

@end

@implementation MRCNotificationTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    self.title = @"MRC自定义类,不写remove observe";
    
    MRCNewObject *obj = [[MRCNewObject alloc] init];
    [obj release];
    
    NSLog(@"发广播啦---");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeTest" object:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"发广播啦---");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeTest" object:nil];
}

@end
