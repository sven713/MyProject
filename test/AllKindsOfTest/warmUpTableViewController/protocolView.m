//
//  protocol.m
//  test
//
//  Created by 宋锡铭 on 2021/8/4.
//  Copyright © 2021 sven. All rights reserved.
//

#import "protocolView.h"

@interface protocolView ()
@property (nonatomic, strong) UIButton *blockBtn;
@end

@implementation protocolView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.blockBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [self addSubview:self.blockBtn];
    self.blockBtn.backgroundColor = [UIColor sv_randomColor];
    [self.blockBtn addTarget:self action:@selector(blockBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 遵守协议, 设置代理, 实现代理方法
    self.backgroundColor = [UIColor sv_randomColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickSelf)];
    [self addGestureRecognizer:tap];
}

-(void)clickSelf {
    if (self.delegate && [self.delegate respondsToSelector:@selector(pViewClickView:parm:)]) {
        [self.delegate pViewClickView:self parm:@"哈哈哈哈"];
    }
}

- (void)blockBtnClick {
    if (self.clickBlock) {
        self.clickBlock(@"啊啊啊block");
    }
}
@end
