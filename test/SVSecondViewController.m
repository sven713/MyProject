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
#import "OCMemoryStructTestViewController.h"
#import "SVAFNTestViewController.h"
#import "DownloadWebImgTableViewController.h"
#import "UIButton+Spring.h"
#import "UIButton+SVEnlargeEdge.h"

@interface SVSecondViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIButton *showTableVeiw;
@property (nonatomic, strong) UITableView *tableView; //!<入口tableView
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation SVSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self data];
    [self initUI];
}

- (void)data {
    self.dataSource = @[
                        @"GCD调度组",
                        @"OC对象的内存结构",
                        @"AFN测试",
                        @"NSOperation下载Cell图片",
                        @"位移动画",
                        @"关于3D旋转",
                        @"tableView嵌套",
                        @"递归算法",
                        @"模糊文字",
                        @"内存泄漏测试",
                        @"cocoaPods测试",
                        @"镂空测试",
                        @"Copy MutableCopy[keep]",
                        @"动画,线程[keep]",
                        @"block测试",
                        @"copy strong[keep]",
                        @"分类Runtime测试[TT]",
                        @"自动布局[TT]",
                        @"CALayer动画[TT]",
                        @"锚点[TT]",
                        @"warmUpTable",
                        @"多代理测试",
                        @"多代理2022_3_4",
                        @"线程保活2022_9_14",
                        ];
}


- (void)initUI {
    self.view.backgroundColor = [UIColor brownColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 80, 260, 50)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"push带block的Alert, 关联对象控制器浮层" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.acceptEventInterval = 0.5;

    self.showTableVeiw = [[UIButton alloc]initWithFrame:CGRectMake(10, 150, 200, 50)];
    self.showTableVeiw.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.showTableVeiw];
//    self.showTableVeiw.isSpring = false;
    [self.showTableVeiw setTitle:@"自动计算cell高度" forState:UIControlStateNormal];
    self.showTableVeiw.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.showTableVeiw addTarget:self action:@selector(showTableView) forControlEvents:UIControlEventTouchUpInside];
    [self.showTableVeiw setLargeLeft:20 top:20 right:20 bottom:20];
    
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
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"SVSecondViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    NSString *title = self.dataSource[indexPath.row];
    cell.textLabel.text = title;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[GCDGroupTestViewController new] animated:YES];
            break;
        case 1:{
            OCMemoryStructTestViewController *vc = [OCMemoryStructTestViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
//            [NSString] // string from class??
            SVAFNTestViewController *vc = [SVAFNTestViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            DownloadWebImgTableViewController *vc = [DownloadWebImgTableViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            UIViewController *vc = [NSClassFromString(@"MoveTestViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            UIViewController *vc = [NSClassFromString(@"Transform3DViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            UIViewController *vc = [NSClassFromString(@"NestTableViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            UIViewController *vc = [NSClassFromString(@"DiGuiViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 8:
        {
            UIViewController *vc = [NSClassFromString(@"TextBlurViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            case 9:
            {
                UIViewController *vc = [NSClassFromString(@"SVLeakTestViewController") new];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
        case 10:
        {
            UIViewController *vc = [NSClassFromString(@"CocoaPodsTestViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            case 11:
            {
                UIViewController *vc = [NSClassFromString(@"MaskTestViewController") new];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
        case 12:
        {
            UIViewController *vc = [NSClassFromString(@"CopyTestViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 13:
        {
            UIViewController *vc = [NSClassFromString(@"AnimateTestViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 14:
        {
            UIViewController *vc = [NSClassFromString(@"BlockTestViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 15:
        {
            UIViewController *vc = [NSClassFromString(@"CopyStrongTestViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 16:
        {
            UIViewController *vc = [NSClassFromString(@"CategoryTestViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 17:
        {
            UIViewController *vc = [NSClassFromString(@"AutoLayoutViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 18:
        {
            UIViewController *vc = [NSClassFromString(@"CoreAnimationViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 19:
        {
            UIViewController *vc = [NSClassFromString(@"AnchoPointViewController") new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 20:{
            UIViewController *vc = [NSClassFromString(@"warmUpTableViewController") new];
            vc.hidesBottomBarWhenPushed = true;
            [self.navigationController pushViewController:vc animated:true];
        }
            
        case 21:{
            UIViewController *vc = [NSClassFromString(@"MutipleDelegateTestViewController") new];
            vc.hidesBottomBarWhenPushed = true;
            [self.navigationController pushViewController:vc animated:true];
        }
            
        case 22:{
            UIViewController *vc = [NSClassFromString(@"MDViewController2022_3_4") new];
            vc.hidesBottomBarWhenPushed = true;
            [self.navigationController pushViewController:vc animated:true];
        }
        case 23:{
            UIViewController *vc = [NSClassFromString(@"KT_firstViewController") new];
            vc.hidesBottomBarWhenPushed = true;
            [self.navigationController pushViewController:vc animated:true];
        }
            
        default:
            break;
    }
}

@end
