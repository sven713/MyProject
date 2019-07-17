//
//  SVNContentCollectionViewCell.m
//  test
//
//  Created by 宋锡铭 on 2019/5/14.
//  Copyright © 2019 sven. All rights reserved.
//

#import "SVNContentCollectionViewCell.h"

@implementation SVNContentCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.backgroundColor = [UIColor sv_randomColor];
}
@end
