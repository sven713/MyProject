//
//  SVProtocalView.m
//  test
//
//  Created by sven on 16/10/26.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVProtocalView.h"

typedef int(^dBlock)(int);
static NSString *str = @"哈哈哈";
@implementation SVProtocalView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(SVProtocalView:logMSG:)]) {
    [self.delegate SVProtocalView:self logMSG:(@"sss")];
    }
    
//    int (^aBlock)(int) = ^(int a){
//        return 3;
//    };
//    
//    void (^bBlock)(int) = ^(int a){
//    
//    };
    
}

- (void)string:(NSString *)str block:(dBlock)block {

}

- (void)str:(NSString *)str block:(BOOL(^)(int a))block {

}

- (void)sortQuick:(NSMutableArray *)arr left:(NSInteger)left right:(NSInteger)right {
    if (left >= right) {
        return;
    }
    NSInteger i = left;
    NSInteger j = right;
    NSInteger point = [arr[left] integerValue];
    while (i != j) {
        while (i < j && point <= [arr[j] integerValue]) {
            j --;
        }
        while (i < j && point >= [arr[i] integerValue]) {
            i ++;
        }
        if (i < j) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:j]; // 交换
        }
    }
    NSLog(@"---while之后的left--%td",left);
    [arr exchangeObjectAtIndex:i withObjectAtIndex:left];
    [self sortQuick:arr left:left right:i - 1];
    [self sortQuick:arr left:i + 1 right:right];
    
    NSLog(@"-->快速排序<<<--%@",arr);
}

@end
