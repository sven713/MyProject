//
//  sort.h
//  test
//
//  Created by sven on 16/11/7.
//  Copyright © 2016年 sven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sort : NSObject
- (instancetype)initWithArr:(NSArray *)arr;
- (void)newSort:(NSMutableArray *)arr left:(NSInteger)left right:(NSInteger)right;
@end
