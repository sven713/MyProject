//
//  MDViewController2022_3_4.m
//  test
//
//  Created by 宋锡铭 on 2022/3/4.
//  Copyright © 2022 sven. All rights reserved.
//

#import "MDViewController2022_3_4.h"
#import "HandleDelegateObj.h"
#import "MutipleDelegate3_4_2022.h"

@interface MDViewController2022_3_4 ()<UIScrollViewDelegate>
@property (nonatomic, strong) HandleDelegateObj *obj;
@property (nonatomic, strong) MutipleDelegate3_4_2022 *delegateHelp;
@end

@implementation MDViewController2022_3_4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrl = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:scrl];
    scrl.contentSize = CGSizeMake(0, 200);
//    scrl.delegate = self;
    scrl.backgroundColor = [UIColor brownColor];
    
    _obj = [HandleDelegateObj new];
//    scrl.delegate = _obj;
    
    self.delegateHelp = [MutipleDelegate3_4_2022 new];
    self.delegateHelp.delegates = @[self, self.obj];
    
    scrl.delegate = (id<UIScrollViewDelegate>)self.delegateHelp;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"控制器滚动");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
