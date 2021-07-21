//
//  BlockTestView.m
//  test
//
//  Created by 宋锡铭 on 2021/7/21.
//  Copyright © 2021 sven. All rights reserved.
//

#import "BlockTestView.h"



@implementation BlockTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.backgroundColor = [UIColor sv_randomColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTestView)];
    [self addGestureRecognizer:tap];
}


- (void)clickTestView {
    self.block(222);
}
@end
