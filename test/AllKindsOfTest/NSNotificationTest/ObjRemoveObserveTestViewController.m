//
//  ObjRemoveObserveTestViewController.m
//  test
//
//  Created by song ximing on 2016/11/27.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "ObjRemoveObserveTestViewController.h"
#import <objc/runtime.h>

@interface MRCObject : NSObject

@end
@implementation MRCObject

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
    NSLog(@"MRCObject被释放了");
    
    Method a = class_getInstanceMethod([self class], @selector(removeObserver:));
    Method b = class_getInstanceMethod([self class], @selector(removeCall:));
    method_exchangeImplementations(a, b);
}

- (void)removeCall:(id)observe {
    NSLog(@"调用了removeObserve方法--%@",[observe class]);
}

@end


@interface ObjRemoveObserveTestViewController ()

@end

@implementation ObjRemoveObserveTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    self.title = @"自定义类,不写remove observe";
    
    MRCObject *obj = [[MRCObject alloc] init];
    
    NSLog(@"发广播啦---");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeTest" object:nil];
}
@end
