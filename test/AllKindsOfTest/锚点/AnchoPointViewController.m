//
//  AnchoPointViewController.m
//  test
//
//  Created by 宋锡铭 on 2021/7/27.
//  Copyright © 2021 sven. All rights reserved.
//

#import "AnchoPointViewController.h"

@interface AnchoPointViewController ()

@end

@implementation AnchoPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}

- (void) test {
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 500, 300)];
    [self.view addSubview:bg];
    bg.backgroundColor = [UIColor sv_randomColor];
    
    
    UIView *testV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    testV.backgroundColor = [UIColor sv_randomColor];
    
    [bg addSubview:testV];
    
    testV.layer.anchorPoint = CGPointMake(0, 0);
    
//    testV.layer.position.x = testV.frame.origin.x + testV.frame.size.width * testV.layer.anchorPoint.x
    
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
