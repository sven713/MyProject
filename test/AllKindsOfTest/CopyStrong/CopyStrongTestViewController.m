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

@end

@implementation CopyStrongTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableString *mStr = [NSMutableString stringWithString:@"a"];
    
    
    self.cStr = mStr;
    
    self.strongStr = mStr;
    
    [mStr appendString:@"b"];
    
    NSLog(@"cStr:%@--strong:%@",self.cStr, self.strongStr); // cStr是a, strongStr是ab
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
