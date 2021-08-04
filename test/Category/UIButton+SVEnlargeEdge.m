//
//  UIButton+SVEnlargeEdge.m
//  test
//
//  Created by 宋锡铭 on 2021/7/30.
//  Copyright © 2021 sven. All rights reserved.
//

#import "UIButton+SVEnlargeEdge.h"
#import <objc/runtime.h>

const NSString * leftKey = @"kLeft";
const NSString * rightKey = @"kRight";
const NSString * topKey = @"kTop";
const NSString * bottomKey = @"kBottom";

@implementation UIButton (SVEnlargeEdge)

//runtime 增加属性; 重写pointInside

- (void)setLargeLeft:(NSInteger)left top:(NSInteger)top right:(NSInteger)right bottom:(NSInteger)bottom {
    
    objc_setAssociatedObject(self, &leftKey, [NSNumber numberWithInteger:left], OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(self, &rightKey, [NSNumber numberWithInteger:right], OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(self, &topKey, [NSNumber numberWithInteger:top], OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(self, &bottomKey, [NSNumber numberWithInteger:bottom], OBJC_ASSOCIATION_ASSIGN);
    
}


//-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    
////    if(self.opaque == 0 || self.hidden == true){
////        return false;
////    }
//    
//    NSNumber *left = objc_getAssociatedObject(self, &leftKey);
//    NSNumber *right = objc_getAssociatedObject(self, &rightKey);
//    NSNumber *top = objc_getAssociatedObject(self, &topKey);
//    NSNumber *bottom = objc_getAssociatedObject(self, &bottomKey);
//    
////    CGRect rect = CGRectMake(self.frame.origin.x - left.integerValue, self.frame.origin.y - top.intValue, self.frame.size.width + left.integerValue + right.integerValue, self.frame.size.height + top.integerValue + bottom.integerValue);
//    
//    CGRect rect = self.bounds;
//    if(left && right && top && bottom){
//        rect = CGRectMake(self.frame.origin.x - left.integerValue, self.frame.origin.y - top.intValue, self.frame.size.width + left.integerValue + right.integerValue, self.frame.size.height + top.integerValue + bottom.integerValue);
//    }else {
//        
//    }
//    
//    return CGRectContainsPoint(rect, point);
//}


@end
