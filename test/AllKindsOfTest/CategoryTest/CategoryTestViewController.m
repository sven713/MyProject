//
//  CategoryTestViewController.m
//  test
//
//  Created by 宋锡铭 on 2021/7/26.
//  Copyright © 2021 sven. All rights reserved.
//

#import "CategoryTestViewController.h"
#import "Person.h"

@interface CategoryTestViewController ()

@end

@implementation CategoryTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *p = [[Person alloc] init];
    [p run];
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
