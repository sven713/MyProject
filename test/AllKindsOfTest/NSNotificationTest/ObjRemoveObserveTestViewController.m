//
//  ObjRemoveObserveTestViewController.m
//  test
//
//  Created by song ximing on 2016/11/27.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "ObjRemoveObserveTestViewController.h"
#import "NotificationTest.h"

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
    
//    MRCObject *obj = [[MRCObject alloc] init];
    NotificationTest *testObj = [[NotificationTest alloc]init];
    
    NSLog(@"发广播啦---");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeTest" object:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"发广播啦---");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeTest" object:nil];
}
@end
