//
//  SVProtocalView.h
//  test
//
//  Created by sven on 16/10/26.
//  Copyright © 2016年 sven. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SVProtocalView;

@protocol SVProtocalViewDelegate <NSObject>

- (void)SVProtocalView:(SVProtocalView *)SVProtocalView logMSG:(NSString *)msg;

@end

@interface SVProtocalView : UIView
@property (nonatomic, weak)id<SVProtocalViewDelegate>delegate;
- (void)sortQuick:(NSMutableArray *)arr left:(NSInteger)left right:(NSInteger)right;
@end
