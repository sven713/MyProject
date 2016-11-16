//
//  UITableViewCell+SVAutoCalcuCellHeight.h
//  test
//
//  Created by sven on 16/11/16.
//  Copyright © 2016年 sven. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HDFCellConfigBlock)(UITableViewCell *cell);

@interface UITableViewCell (SVAutoCalcuCellHeight)

- (void)hdf_setCellLastView:(UIView *)lastView;

- (void)hdf_setCellLastView:(UIView *)lastView bottomOffset:(CGFloat)bottomOffset;

+ (CGFloat)hdf_heightForIndexPath:(NSIndexPath *)indexPath configBlock:(HDFCellConfigBlock)configBlock;

@end
