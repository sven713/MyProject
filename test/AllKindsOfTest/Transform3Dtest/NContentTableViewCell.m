
//
//  NContentTableViewCell.m
//  test
//
//  Created by 宋锡铭 on 2019/5/14.
//  Copyright © 2019 sven. All rights reserved.
//

#import "NContentTableViewCell.h"
#import "NFirestViewController.h"
#import "SVNestLib/SVNestContentView.h"

@interface NContentTableViewCell ()
@property (nonatomic, strong) SVNestContentView *nestContentView;
@end

@implementation NContentTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //cell上加上了collectionView 数据源是控制器
        self.nestContentView = [[SVNestContentView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:self.nestContentView];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.nestContentView.frame = self.bounds;
}

- (void)configVCArray:(NSArray *)arr {
    NSMutableArray *tempVCs = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NFirestViewController *vc = [[NFirestViewController alloc] init];
        [self.viewController addChildViewController:vc];
        [tempVCs addObject:vc];
    }];
    
    self.nestContentView.childsVCs = [tempVCs copy];
}

- (void)setCellCanScroll:(BOOL)cellCanScroll
{
    _cellCanScroll = cellCanScroll;
    
    for (NFirestViewController *VC in self.nestContentView.childsVCs) {
        VC.vcCanScroll = cellCanScroll;
        if (!cellCanScroll) {//如果cell不能滑动，代表到了顶部，修改所有子vc的状态回到顶部
            VC.tableView.contentOffset = CGPointZero;
        }
    }
}

@end
