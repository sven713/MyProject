//
//  SVSecondViewController.m
//  test
//
//  Created by sven on 16/11/9.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVSecondViewController.h"
#import "UIControl+UIControl_SVTouchEventInterval.h"
#import "SVThirdViewController.h"
#import "SVTableViewCellHeightAutoTestVC.h"
#import "Masonry.h"
#import "GCDGroupTestViewController.h"

@interface SVSecondViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIButton *showTableVeiw;
@property (nonatomic, strong) UITableView *tableView; //!<入口tableView
@end

@implementation SVSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    self.view.backgroundColor = [UIColor brownColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 260, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"push带block的Alert, 关联对象控制器浮层" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.acceptEventInterval = 0.5;

    self.showTableVeiw = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 100)];
    self.showTableVeiw.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.showTableVeiw];
    [self.showTableVeiw setTitle:@"自动计算cell高度" forState:UIControlStateNormal];
    self.showTableVeiw.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.showTableVeiw addTarget:self action:@selector(showTableView) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.showTableVeiw.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    self.tableView.backgroundColor = [UIColor yellowColor];
}

- (void)nextVC {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        SVThirdViewController *vc = [SVThirdViewController new];
    
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
//    });
}

- (void)showTableView {
    SVTableViewCellHeightAutoTestVC *vc = [[SVTableViewCellHeightAutoTestVC alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"SVSecondViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[GCDGroupTestViewController new] animated:YES];
}

@end
