//
//  MutipleDelegateHelper.h
//  test
//
//  Created by 宋锡铭 on 2022/3/3.
//  Copyright © 2022 sven. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MutipleDelegateHelper : NSObject

- (void)addDelegate:(id)delegate;

@property (nonatomic, strong) NSMutableArray *delegateArr;

@end

NS_ASSUME_NONNULL_END
