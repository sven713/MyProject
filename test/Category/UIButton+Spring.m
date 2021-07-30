//
//  UIButton+Spring.m
//  test
//
//  Created by 宋锡铭 on 2021/7/30.
//  Copyright © 2021 sven. All rights reserved.
//

#import "UIButton+Spring.h"
#import <objc/runtime.h>

const NSString * springKey = @"kspringKey";

@implementation UIButton (Spring)

// initWithFrame替换成svInitWithFrame; 增加isSpring属性; 点击的时候,判断如果isSpring就做一个放大动画


+(void)load {
    Class class = [self class];
    Method  old = class_getInstanceMethod(class, @selector(initWithFrame:));
    Method new = class_getInstanceMethod(class, @selector(sv_initWithFrame:));
    
    method_exchangeImplementations(old, new);
}

- (instancetype)sv_initWithFrame:(CGRect)frame {
    UIButton *btn = [self sv_initWithFrame:frame];
    btn.isSpring = true;
    
    [btn addTarget:btn action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)click:(UIButton *)btn {

    if(self.isSpring){
        [UIView animateWithDuration:0.2 animations:^{
            btn.transform = CGAffineTransformMakeScale(1.3, 1.3);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                btn.transform = CGAffineTransformMakeScale(1, 1);
            }];
        }];
    }
}



-(BOOL)isSpring {
    
    NSLog(@"zhi----%@",objc_getAssociatedObject(self, &springKey));
    
    return  [objc_getAssociatedObject(self, &springKey) floatValue];
}

-(void)setIsSpring:(BOOL)isSpring {

    objc_setAssociatedObject(self, &springKey, [NSString stringWithFormat:@"%d",isSpring], OBJC_ASSOCIATION_ASSIGN);
}

@end
