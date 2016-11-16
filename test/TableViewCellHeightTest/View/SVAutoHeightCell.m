//
//  SVAutoHeightCell.m
//  test
//
//  Created by sven on 16/11/16.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVAutoHeightCell.h"
#import "Masonry.h"
//#import "UITableViewCell+HDFTableViewCell.h"
#import "UITableViewCell+SVAutoCalcuCellHeight.h"

@interface SVAutoHeightCell ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation SVAutoHeightCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    UILabel *label = [[UILabel alloc]init];
    [self.contentView addSubview:label];
    label.backgroundColor = [UIColor orangeColor];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
        make.top.mas_equalTo(30);
    }];
    label.numberOfLines = 0;
    self.label = label;
    
    [self hdf_setCellLastView:label bottomOffset:10];
}

- (void)configWithString:(NSString *)str {
    self.label.text = str;
}

@end
