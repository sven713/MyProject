//
//  NSObject+Leaks.h
//  test
//
//  Created by 宋锡铭 on 2019/12/5.
//  Copyright © 2019 sven. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Leaks)

- (void)willDealoc; //??????

+ (void)swizzSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;
@end

NS_ASSUME_NONNULL_END
