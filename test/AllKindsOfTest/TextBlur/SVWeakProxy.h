//
//  SVWeakProxy.h
//  test
//
//  Created by 宋锡铭 on 2019/12/4.
//  Copyright © 2019 sven. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SVWeakProxy : NSProxy
@property (nonatomic, weak) id target;
@end

NS_ASSUME_NONNULL_END
