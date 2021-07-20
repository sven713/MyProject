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
                        @"Copy MutableCopy"
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
//    if (indexPath.row == 0) {
//        cell.textLabel.text = @"GCD调度组";
//    }else if(indexPath.row == 1){
//        cell.textLabel.text = @"OC对象的内存结构";
//    }else if (indexPath.row == 2){
//        cell.textLabel.text = @"AFN测试";
//    }else if (indexPath.row == 3){
//        cell.textLabel.text = @"NSOperation下载Cell图片";
//    }else if (indexPath.row == 4){
//        cell.textLabel.text = @"位移动画";
//    }else if (indexPath.row == 5){
//        cell.textLabel.text = @"关于3D旋转";
//    }else if (indexPath.row == 6){
//        cell.textLabel.text = @"tableView嵌套";
//    }
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
        default:
            break;
    }
}

@end
