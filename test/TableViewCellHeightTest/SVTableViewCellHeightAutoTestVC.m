//
//  SVTableViewCellHeightAutoTestVC.m
//  test
//
//  Created by sven on 16/11/16.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "SVTableViewCellHeightAutoTestVC.h"
#import "SVAutoHeightCell.h"
//#import "UITableViewCell+HDFTableViewCell.h"
#import "UITableViewCell+SVAutoCalcuCellHeight.h"

@interface SVTableViewCellHeightAutoTestVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation SVTableViewCellHeightAutoTestVC

#pragma mark - lifeCycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

#pragma mark - UI
- (void)configUI {
    self.title = @"自动计算cell行高";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.hidden = NO;
}

#pragma mark - TableView delegate datasource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SVAutoHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SVAutoHeightCell"];
    [cell configWithString:self.dataSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [SVAutoHeightCell hdf_heightForIndexPath:indexPath configBlock:^(UITableViewCell *cell) {
        SVAutoHeightCell *mycell = (SVAutoHeightCell *)cell;
        [mycell configWithString:self.dataSource[indexPath.row]];
    } ];
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

#pragma mark - Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView registerClass:[SVAutoHeightCell class] forCellReuseIdentifier:@"SVAutoHeightCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 0.5)]; // 去掉多余的cell
    }
    return _tableView;
}

-(NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"一行",@"两行\n二行",@"三行\nss\n三行\n大师傅\ndasf\ndasf"];
    }
    return _dataSource;
}

@end
