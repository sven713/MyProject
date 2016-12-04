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
@property (nonatomic, strong) UIImageView *imageView; //!<一直旋转的图片
@property (nonatomic, assign) CGFloat angle;
@end

@implementation ObjRemoveObserveTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    self.title = @"自定义类,不写remove observe";
    self.angle = 1;
//    MRCObject *obj = [[MRCObject alloc] init];
    NotificationTest *testObj = [[NotificationTest alloc]init];
    
    NSLog(@"发广播啦---");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeTest" object:nil];
    
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"发广播啦---");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeTest" object:nil];
    [self rotateImage];
}

- (void)rotateImage {
    self.imageView.image = [UIImage imageNamed:@"iPhone_患者端首页_医院_未选中"];
    CGAffineTransform transform = CGAffineTransformMakeRotation(self.angle *(M_PI / 180));
    [UIView animateWithDuration:0.1 animations:^{
        self.imageView.transform = transform;
    } completion:^(BOOL finished) {
        self.angle += 10;
        [self rotateImage];
    }];
}

@end
