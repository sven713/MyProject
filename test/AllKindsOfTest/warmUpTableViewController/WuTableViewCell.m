//
//  WuTableViewCell.m
//  test
//
//  Created by 宋锡铭 on 2021/8/4.
//  Copyright © 2021 sven. All rights reserved.
//

#import "WuTableViewCell.h"

@interface WuTableViewCell ()
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, assign) NSInteger myIdx;
@end

@implementation WuTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.contentView addSubview:self.btn];
    self.btn.backgroundColor = [UIColor sv_randomColor];
    [self.btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick {
    if (self.btnClickBlock) {
        self.btnClickBlock(self.myIdx);
    }
}

- (void)configData:(NSInteger)idx {
    self.myIdx = idx;
    [self.btn setTitle:[NSString stringWithFormat:@"下标%ld",idx] forState:UIControlStateNormal];
}

@end
