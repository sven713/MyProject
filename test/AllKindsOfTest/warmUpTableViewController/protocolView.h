//
//  protocol.h
//  test
//
//  Created by 宋锡铭 on 2021/8/4.
//  Copyright © 2021 sven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class protocolView;

@protocol pViewClickDelegate <NSObject>

- (void)pViewClickView:(protocolView *)view parm:(NSString *)parm;

@end

@interface protocolView : UIView
@property(nonatomic, weak) id<pViewClickDelegate> delegate;


@property(nonatomic, copy) void(^clickBlock)(NSString *parm);

@end

NS_ASSUME_NONNULL_END
