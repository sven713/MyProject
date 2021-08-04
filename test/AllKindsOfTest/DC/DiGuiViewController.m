



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
    
    [self testQuickSort];
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

- (void)testQuickSort {
    NSArray *arr = @[@(3),@(2),@(6),@(8),@(4),@(1)];
    
    NSMutableArray *mArr = [arr mutableCopy];//[NSMutableArray arrayWithArray:arr];
    [self quickSortArr:mArr left:0 rigth:mArr.count - 1];
    
    NSLog(@"数组%@",mArr);
#warning 快速排序,卡了半天,因为忘记了NSMutableArray只能放对象, 并且NSumber比较需要转换成int
}


- (NSMutableArray *)quickSortArr:(NSMutableArray <NSNumber *>*)arr left:(NSInteger)left rigth:(NSInteger)right {
    if(left < right) {
        NSInteger povIdx = [self partionArr:arr left:left right:right];
        [self quickSortArr:arr left:left rigth:(povIdx - 1 < left ? left : povIdx - 1)];
        [self quickSortArr:arr left:(povIdx + 1 > right ? right : povIdx + 1) rigth:right];
    }
    return  arr;
}

- (NSInteger)partionArr:(NSMutableArray <NSNumber *>*)arr left:(NSInteger)left right:(NSInteger)right {
    NSInteger povIdx = right;
    NSInteger startIdx = left;
    for(NSInteger i = left; i < right; i++) {
        if(arr[i].integerValue < arr[povIdx].integerValue) {
//            [arr exchangeObjectAtIndex:i withObjectAtIndex:startIdx];
            [self swap:arr i:i j:startIdx];
            startIdx++;
        }
    }
//    [arr exchangeObjectAtIndex:startIdx withObjectAtIndex:povIdx];
    
    [self swap:arr i:startIdx j:povIdx];
    return startIdx;
}

- (void)swap:(NSMutableArray *)arr i:(NSInteger)i j:(NSInteger)j {
    id temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

@end
