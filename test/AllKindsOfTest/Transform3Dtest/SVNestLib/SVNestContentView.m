
//
//  SVNestContentView.m
//  test
//
//  Created by 宋锡铭 on 2019/5/14.
//  Copyright © 2019 sven. All rights reserved.
//

#import "SVNestContentView.h"
#import "SVNContentCollectionViewCell.h"

@interface SVNestContentView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flow;
@end

@implementation SVNestContentView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.flow.itemSize = self.size;
    self.collectionView.frame = self.bounds;
}

- (void)initUI {
    [self.collectionView registerClass:[SVNContentCollectionViewCell class] forCellWithReuseIdentifier:@"SVNContentCollectionViewCell"];
    self.collectionView.pagingEnabled = YES;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SVNContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SVNContentCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.childsVCs.count;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIViewController *childVc = self.childsVCs[indexPath.row];
    childVc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:childVc.view];
}


-(UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flow.itemSize = self.size;
//        flow.minimumInteritemSpacing = 0;
        flow.minimumLineSpacing = 0;
        flow.minimumInteritemSpacing = 0;
        self.flow = flow;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
        [self addSubview:_collectionView];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
    }
    return _collectionView;
}

@end
