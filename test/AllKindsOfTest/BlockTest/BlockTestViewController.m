//
//  BlockTestViewController.m
//  test
//
//  Created by 宋锡铭 on 2021/7/21.
//  Copyright © 2021 sven. All rights reserved.
//

#import "BlockTestViewController.h"
#import "BlockTestView.h"

@interface BlockTestViewController ()
@property (nonatomic, copy) void(^propertyBlock)(NSString * name);

@property (nonatomic, strong) BlockTestView *blockView;
@end

@implementation BlockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.propertyBlock = ^(NSString *name){
        NSLog(@"block属性-->%@",name);
    };
    
    self.propertyBlock(@"哈哈哈");
    
    
    self.blockView = [[BlockTestView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.blockView];
    
    self.blockView.block = ^ (NSInteger num) {
        NSLog(@"点击啥了--%ld",(long)num);
    };
    
    
    self.blockView.blockNameName(333); //内部实现,外部调用,外部传递参数,更新视图
    
    
    [self.blockView blocktest_asParm:^(NSString * _Nonnull parm) { //网络请求; 内部实现,外部调用,外部获取参数
        NSLog(@"控制器获得了数据%@",parm);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
