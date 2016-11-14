//
//  UIAlertView+SVBlockAlertView.m
//  test
//
//  Created by sven on 16/11/14.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "UIAlertView+SVBlockAlertView.h"
#import <objc/runtime.h>

static const void *sv_blockAlertView = "sv_blockAlertView";

@implementation UIAlertView (SVBlockAlertView)
-(void)setBlock:(SVVoidBlock)block {
    objc_setAssociatedObject(self, sv_blockAlertView, block, OBJC_ASSOCIATION_COPY_NONATOMIC); // 策略?
}

-(SVVoidBlock)block {
    return objc_getAssociatedObject(self, sv_blockAlertView);
}

+(UIAlertView *)sv_showOKWithTitle:(NSString *)title
                           message:(NSString *)message
                       buttonTitles:(NSString *)titles
                             block:(SVVoidBlock)block {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:[UIApplication sharedApplication] cancelButtonTitle:titles otherButtonTitles:nil, nil];
    alert.block = block;
    [alert show];
    return alert;
}

@end
