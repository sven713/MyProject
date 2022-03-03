//
//  NSObject+Delegates.h
//  test
//
//  Created by 宋锡铭 on 2022/3/3.
//  Copyright © 2022 sven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MutipleDelegateHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Delegates)
@property (nonatomic, strong) MutipleDelegateHelper *mutipleDelegatesHelper;
@end

NS_ASSUME_NONNULL_END
