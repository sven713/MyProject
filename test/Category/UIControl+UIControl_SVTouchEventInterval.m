//
//  UIControl+UIControl_SVTouchEventInterval.m
//  test
//
//  Created by sven on 16/11/9.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "UIControl+UIControl_SVTouchEventInterval.h"
#import <objc/runtime.h>

static const char *keyAccessEventInterval = "accessEventInterval";
static const char *keyIsIgnoreEvent = "keyIsIgnoreEvent";

@interface UIControl ()
@property (nonatomic, assign) BOOL isIgnoreEvent; //!<是否忽略点击事件
@end

@implementation UIControl (UIControl_SVTouchEventInterval)

+ (void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(intervalSendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)intervalSendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    // 如果时间短于设置的时间
    if (self.isIgnoreEvent) {
        return;
    }
    if (self.acceptEventInterval) { // 设置了最短时间
        self.isIgnoreEvent = YES;
        [self performSelector:@selector(resetIsIgnoreEvent) withObject:target afterDelay:self.acceptEventInterval];
    }
    [self intervalSendAction:action to:target forEvent:event];
}

- (void)resetIsIgnoreEvent {
    self.isIgnoreEvent = NO; // 设置成no才能继续响应
}

#pragma mark - Getter/Setter
-(void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval {
    objc_setAssociatedObject(self, keyAccessEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSTimeInterval)acceptEventInterval {
    return [objc_getAssociatedObject(self, keyAccessEventInterval) doubleValue]; // NSTimeInterval 是Double类型的
}

-(void)setIsIgnoreEvent:(BOOL)isIgnoreEvent {
    objc_setAssociatedObject(self, keyIsIgnoreEvent, @(isIgnoreEvent), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)isIgnoreEvent {
    return [objc_getAssociatedObject(self, keyIsIgnoreEvent) boolValue]; // 不写BoolValue点击会出问题,self.isIgnoreEvent一直是yes
}

@end
