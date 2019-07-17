



//
//  DiGuiViewController.m
//  test
//
//  Created by 宋锡铭 on 2019/7/17.
//  Copyright © 2019 sven. All rights reserved.
//

#import "DiGuiViewController.h"

@interface DiGuiViewController ()

@end

@implementation DiGuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSArray *source = @[@(1),@(2),@(3)];
//    NSArray *source = @[];
//    NSArray *source = @[@(1)];
//    NSArray *source = @[@(1),@(2),@(3),@(4)];
    NSInteger result = [self sumResultSourceArr:source];
    NSLog(@"sun结果:%zd",result);
    
    NSInteger count = [self sumArrLength:source];
    NSLog(@"数组长度:%zd",count);
}

// 递归求和
- (NSInteger)sumResultSourceArr:(NSArray *)arr {
    
    // 如果arr.cont = 0 return0; 如果arr.count = 1 reutrn元素;
    // 其他情况 返回 第一个元素+排除掉第一个元素的剩下的数组
    
    if (arr.count == 0) {
        return 0;
    }
//    else if (arr.count == 1){
//        NSNumber *number = arr[0];
//        return number.intValue;
//    }
    else {
        NSNumber *first = arr[0];
        NSMutableArray *temp = [arr mutableCopy];
        [temp removeObject:first];
        return first.integerValue + [self sumResultSourceArr:temp];
    }
    
}

// 递归求数组长度
- (NSInteger)sumArrLength:(NSArray *)arr {
    // 如果数组是空,返回0
    // 如果不是空,返回1+去掉第一个元素的数组
    
    if ([arr isEqual:@[]]) {
        return 0;
    }else {
        
        NSMutableArray *mArr = [arr mutableCopy];
        id obj = mArr[0];
        [mArr removeObject:obj];
        return 1 + [self sumArrLength:mArr];
    }
    
}

@end
