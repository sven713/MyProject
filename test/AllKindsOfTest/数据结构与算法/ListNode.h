//
//  Node.h
//  test
//
//  Created by 宋锡铭 on 2020/5/28.
//  Copyright © 2020 sven. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject
-(instancetype)initWithElement:(int)element;
@property (nonatomic, assign) int value;
@property (nonatomic, strong) ListNode *next;
@end

NS_ASSUME_NONNULL_END
