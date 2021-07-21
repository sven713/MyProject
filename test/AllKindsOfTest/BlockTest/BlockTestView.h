//
//  BlockTestView.h
//  test
//
//  Created by 宋锡铭 on 2021/7/21.
//  Copyright © 2021 sven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^blockName)(NSInteger num);

@interface BlockTestView : UIView
@property (nonatomic, copy) blockName block;
@end

NS_ASSUME_NONNULL_END
