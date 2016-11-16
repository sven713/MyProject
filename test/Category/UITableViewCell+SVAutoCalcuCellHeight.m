//
//  UITableViewCell+SVAutoCalcuCellHeight.m
//  test
//
//  Created by sven on 16/11/16.
//  Copyright © 2016年 sven. All rights reserved.
//  //#import "UITableViewCell+HDFTableViewCell.h"  参考

#import "UITableViewCell+SVAutoCalcuCellHeight.h"
#import <objc/runtime.h>

@interface UITableViewCell ()
@property (nonatomic, strong) UIView *hdf_cellLastView;
@property (nonatomic, assign) CGFloat hdf_bottomOffsetToCellLastView;
@end

static const void *hdf_cellLastViewkey = "hdf_cellLastView";
static const void *hdf_bottomOffsetToCellLastViewKey = "hdf_bottomOffsetToCellLastViewKey";

@implementation UITableViewCell (SVAutoCalcuCellHeight)

+ (CGFloat)hdf_heightForIndexPath:(NSIndexPath *)indexPath configBlock:(HDFCellConfigBlock)configBlock {
    UITableViewCell *cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (configBlock) {
        configBlock(cell);
    }
    
    return [cell hdf_heightForIndexPath:indexPath];
}

- (CGFloat)hdf_heightForIndexPath:(NSIndexPath *)indexPath {

    NSAssert(self.hdf_cellLastView != nil, @"您未指定cell排列中最后一个视图对象，无法计算cell的高度");
    
    [self layoutIfNeeded];
    
    CGFloat rowHeight = self.hdf_cellLastView.frame.size.height + self.hdf_cellLastView.frame.origin.y;
    rowHeight += self.hdf_bottomOffsetToCellLastView;
    
    
    return rowHeight;
}

- (void)hdf_setCellLastView:(UIView *)lastView bottomOffset:(CGFloat)bottomOffset {
//    self.hdf_heightAssitant.hdf_lastView = lastView;
//    self.hdf_heightAssitant.hdf_offset = bottomOffset;
    
    self.hdf_cellLastView = lastView;
    self.hdf_bottomOffsetToCellLastView = bottomOffset;
}

- (void)hdf_setCellLastView:(UIView *)lastView {
    [self hdf_setCellLastView:lastView bottomOffset:0];
}

-(void)setHdf_cellLastView:(UIView *)hdf_cellLastView {
    objc_setAssociatedObject(self, hdf_cellLastViewkey, hdf_cellLastView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)hdf_cellLastView {
    return objc_getAssociatedObject(self, hdf_cellLastViewkey);
}

-(void)setHdf_bottomOffsetToCellLastView:(CGFloat)hdf_bottomOffsetToCellLastView {
    NSNumber *num = [NSNumber numberWithFloat:hdf_bottomOffsetToCellLastView];
    objc_setAssociatedObject(self, hdf_bottomOffsetToCellLastViewKey, num, OBJC_ASSOCIATION_ASSIGN);
}

-(CGFloat)hdf_bottomOffsetToCellLastView {
    NSNumber *num = objc_getAssociatedObject(self, hdf_bottomOffsetToCellLastViewKey);
    return num.floatValue;
}

@end
