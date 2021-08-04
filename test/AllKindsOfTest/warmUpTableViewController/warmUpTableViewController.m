//
//  warmUpTableViewController.m
//  test
//
//  Created by 宋锡铭 on 2021/8/4.
//  Copyright © 2021 sven. All rights reserved.
//

#import "warmUpTableViewController.h"
#import "WuTableViewCell.h"

@interface warmUpTableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation warmUpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WuTableViewCell class] forCellReuseIdentifier:@"cell"];
}

//tableview

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    WuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    [cell configData:indexPath.row];
    cell.btnClickBlock = ^(NSInteger parm) {
        NSLog(@"点击了按钮%ld",(long)parm);
    };
    return  cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

@end
