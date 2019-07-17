
//
//  NestTableViewController.m
//  test
//
//  Created by 宋锡铭 on 2019/5/14.
//  Copyright © 2019 sven. All rights reserved.
//

#import "NestTableViewController.h"
#import "NContentTableViewCell.h"

@interface GesTableView : UITableView

@end

@implementation GesTableView

/**
 同时识别多个手势
 
 @param gestureRecognizer gestureRecognizer description
 @param otherGestureRecognizer otherGestureRecognizer description
 @return return value description
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end

@interface NestTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) GesTableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, strong) NContentTableViewCell *contentCell;
@end

@implementation NestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    [self initUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"NLleaveTop" object:nil];
}

#pragma mark notify
- (void)changeScrollStatus//改变主视图的状态
{
    self.canScroll = YES;
    self.contentCell.cellCanScroll = NO;
}

- (void)requestData {
    self.dataArr = @[@"1",@"2"];
}

- (void)initUI {
    [self.tableView registerClass:[NContentTableViewCell class] forCellReuseIdentifier:@"NContentTableViewCell"];
    UIImageView *headIv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
    headIv.image = [UIImage imageNamed:@"fastGameRaceTrackBackground"];
    self.tableView.tableHeaderView = headIv;
}


#pragma mark - tableView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 90)];
    view.backgroundColor = [UIColor yellowColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NContentTableViewCell"];
    cell.backgroundColor = [UIColor orangeColor];
    [cell configVCArray:self.dataArr];
    self.contentCell = cell;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100;
    return CGRectGetHeight(self.view.bounds) - self.navigationController.navigationBar.bottom;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat bottomCellOffset = [_tableView rectForSection:0].origin.y;
    
    if (scrollView.contentOffset.y >= bottomCellOffset) {
        scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        if (self.canScroll) {
            self.canScroll = NO;
            self.contentCell.cellCanScroll = YES;
        }
    }else{
        if (!self.canScroll) {//子视图没到顶部
            scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        }
    }
    self.tableView.showsVerticalScrollIndicator = _canScroll?YES:NO;
}

#pragma mark - Getter
-(GesTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GesTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
        
}

@end
