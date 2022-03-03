//
//  MutipleDelegateTestViewController.m
//  test
//
//  Created by 宋锡铭 on 2022/3/3.
//  Copyright © 2022 sven. All rights reserved.
//

#import "MutipleDelegateTestViewController.h"
#import "HandleDelegateObj.h"
#import "MutipleDelegateHelper.h"
//#import "NSObject+Delegates.h"

@interface MutipleDelegateTestViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HandleDelegateObj *handleObj;
@property (nonatomic, strong) MutipleDelegateHelper *help;
@end

@implementation MutipleDelegateTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.scrollView.contentSize = CGSizeMake(100, 200);
    [self.view addSubview:self.scrollView];
    
    self.scrollView.backgroundColor = [UIColor orangeColor];
    
    self.handleObj = [HandleDelegateObj new];
//
//
////    self.scrollView.delegate = self.helper; // 这么写helper不知道要遵守什么协议
//
//    self.scrollView.delegate = (id)self.scrollView.mutipleDelegatesHelper;
//    [self.scrollView.mutipleDelegatesHelper addDelegate:self];
//    [self.scrollView.mutipleDelegatesHelper addDelegate:self.handleObj];
    
    
    self.help = [MutipleDelegateHelper new];
    
    self.help.delegateArr = @[self, self.handleObj];
    self.scrollView.delegate = (id<UIScrollViewDelegate>)self.help;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"滚动了%@",NSStringFromClass([self class]));
}

@end
