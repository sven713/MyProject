//
//  MaskTestViewController.m
//  test
//
//  Created by 宋锡铭 on 2019/12/16.
//  Copyright © 2019 sven. All rights reserved.
//

#import "MaskTestViewController.h"

@interface MaskTestViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *coverMask;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation MaskTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    [self configUI];
}

- (void)requestData {
    self.titles = @[@"课程详情",@"课表详情",@"讲师介绍",@"常见问题"];
}

- (void)configUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 60)];
    [self.view addSubview:bgView];
    bgView.backgroundColor = [UIColor redColor];
    self.bgView = bgView;
    
    CGFloat width = self.view.width / 4.0;

    for (NSInteger i = 0; i < 4; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 0, width, bgView.height)];
        [bgView addSubview:btn];
        [btn setTitle:self.titles[i] forState:UIControlStateNormal];
        btn.titleLabel.textColor = [UIColor whiteColor];
    }
    
    UIView *coverMask = [[UIView alloc] initWithFrame:bgView.bounds];
    [bgView addSubview:coverMask];
    coverMask.backgroundColor = [UIColor grayColor];
    self.coverMask = coverMask;
    
    for (NSInteger i = 0; i < 4; i++) {
        UIButton *topBtn = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 0, width, bgView.height)];
        [bgView addSubview:topBtn];
        [topBtn setTitle:self.titles[i] forState:UIControlStateNormal];
        topBtn.titleLabel.textColor = [UIColor blackColor];
        topBtn.tag = 333 + i;
        //TODO:给btn添加block回调
        [topBtn addTarget:self action:@selector(topBtnClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self clipShapXposition:0];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.bgView.bottom, self.view.width, self.view.height - self.bgView.bottom)];
    [self.view addSubview:self.scrollView];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.view.width * self.titles.count, 0);
    self.scrollView.delegate = self;

    
    for (NSInteger i = 0; i < 4; i++) {
        UIView *scrollItem = [[UIView alloc] initWithFrame:CGRectMake(i * self.view.width, 0, self.view.width, self.scrollView.height)];
        [self.scrollView addSubview:scrollItem];
        scrollItem.backgroundColor = [UIColor sv_randomColor];
    }
}

- (void)clipShapXposition:(CGFloat)xPosition {
    CGFloat width = self.view.width / 4.0;
    CGFloat height = 60;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bgView.bounds];
    CGRect testFrame = CGRectMake(xPosition, 0, width, height);
    [path appendPath: [[UIBezierPath bezierPathWithRoundedRect:testFrame cornerRadius:30] bezierPathByReversingPath]];
    CAShapeLayer *mask = [[CAShapeLayer alloc]init];
    mask.path = path.CGPath;
    self.coverMask.layer.mask = mask;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 根据滚动偏移量,移动上面的
    CGFloat scrollOffsetX = scrollView.contentOffset.x;
    NSLog(@"偏移量:%f",scrollOffsetX);
    // 0 0| w, 1/4w | 2w
    [self clipShapXposition:scrollOffsetX / 4.0];
}

#pragma mark - 点击事件
- (void)topBtnClickHandler:(id)sender {
    UIButton *clickBtn = sender;
    NSInteger idx = clickBtn.tag - 333;
    
    [self.scrollView setContentOffset:CGPointMake(idx * self.view.width, 0) animated:YES];
}

@end


