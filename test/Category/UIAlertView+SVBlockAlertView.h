//
//  UIAlertView+SVBlockAlertView.h
//  test
//
//  Created by sven on 16/11/14.
//  Copyright © 2016年 sven. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SVVoidBlock)();
@interface UIAlertView (SVBlockAlertView)
@property (nonatomic, copy) SVVoidBlock block;

+(UIAlertView *)sv_showOKWithTitle:(NSString *)title
                           message:(NSString *)message
                      buttonTitles:(NSString *)titles
                             block:(SVVoidBlock)block;

@end
