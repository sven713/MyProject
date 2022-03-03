//
//  HandleDelegateObj.m
//  test
//
//  Created by 宋锡铭 on 2022/3/3.
//  Copyright © 2022 sven. All rights reserved.
//

#import "HandleDelegateObj.h"

@implementation HandleDelegateObj

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"obj滚动了%@",NSStringFromClass([self class]));
}

@end
