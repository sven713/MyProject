//
//  DownloadWebImgTableViewController.m
//  test
//
//  Created by sven on 17/6/11.
//  Copyright © 2017年 sven. All rights reserved.
//

#import "DownloadWebImgTableViewController.h"
#import "AppInfoModel.h"

@interface DownloadWebImgTableViewController ()
@property (nonatomic, strong) NSArray *modelArr;
@property (nonatomic, strong) NSMutableDictionary *imageDict;
@property (nonatomic, strong) NSMutableDictionary *opertionDict;
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation DownloadWebImgTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
}

-(void)dealloc {
    NSLog(@"下载图片的控制器释放了");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    [self.imageDict removeAllObjects];
//    [self.opertionDict removeAllObjects];
//    [self.queue cancelAllOperations];
//    self.queue = nil;
//    self.imageDict = nil;
//    self.opertionDict = nil;
    
}

- (void)requestData {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"apps.plist" ofType:nil];
    NSArray *temp = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tempModelArr = [NSMutableArray array];
    for (NSDictionary *dict in temp) {
        AppInfoModel *model = [AppInfoModel initWithDict:dict];
        [tempModelArr addObject:model];
//        NSLog(@"model.name-%@",model.name);
    }
    
    self.modelArr = [tempModelArr copy];
//    NSLog(@"%@",self.modelArr);
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.modelArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"DownloadWebImgTableViewControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    AppInfoModel *model = self.modelArr[indexPath.row];
    cell.textLabel.text = model.name;
    
    // 从内存取出图片
    UIImage *img = [self.imageDict objectForKey:model.icon];
    if (img) {
        cell.imageView.image = img;
    }else {
        // 从沙盒取出图片 没有 显示站位图片 开线程下载
        cell.imageView.image = [UIImage imageNamed:@"iPhone_患者端首页_医院_未选中"];
        
        [self downLoadImg:model.icon indePath:indexPath];
    }
    return cell;
}


- (void)downLoadImg:(NSString *)imgUrl indePath:(NSIndexPath *)idx{
    // 判断是否存在下载操作, 有不创建,没有创建
    NSBlockOperation *op = [self.opertionDict objectForKey:imgUrl];
    __weak typeof(self)weakSelf = self;
    if (op == nil){
        op = [NSBlockOperation blockOperationWithBlock:^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl]];
            [NSThread sleepForTimeInterval:4];
            
            UIImage *image = [UIImage imageWithData:data]; // 耗时操作放在子线程
            //                [self.imageDict setObject:image forKey:model.icon]; // 崩溃
//            if (image) {
//                // 把下载好的图片缓存到 图片字典中
//                [weakSelf.imageDict setValue:image forKey:imgUrl]; // 不用weak会崩溃!! 控制器不会被释放
//                // 报错信息:nw_socket_set_common_sockopts setsockopt SO_NOAPNFALLBK failed: [42] Protocol not available, dumping backtrace
//                // malloc: *** error for object 0x61000005c740: pointer being freed was not allocated
//                // *** set a breakpoint in malloc_error_break to debug
//            }
//            
//            //                [self.opertionDict setValue:op forKey:model.icon]; // 缓存下载操作
//            
//            [weakSelf.opertionDict removeObjectForKey:imgUrl]; // 无论成功与否,移除下载操作
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (image) {
                    // 把下载好的图片缓存到 图片字典中
                    [weakSelf.imageDict setValue:image forKey:imgUrl]; // 不用weak会崩溃!! 控制器不会被释放--不是Weak造成的崩溃,是上面注释掉的代码应该写到主线程里面,主线程除了刷新UI, UI对应的数据也要同时更新
                }
                
                [weakSelf.opertionDict removeObjectForKey:imgUrl]; // 无论成功与否,移除下载操作
                // cell.imageView.image = image; // 图片错乱
                [weakSelf.tableView reloadRowsAtIndexPaths:@[idx] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }];
        
        // 如果图片下载失败 移除下载操作,否则失败的op存在就不会再次下载了 下载成功也移除下载操作,因为下载成功了,图片会缓存到imgDict中 从imgDict中直接取
        
        // 那opDict在哪里添加呢? 在这添加了又删除?
        [self.opertionDict setValue:op forKey:imgUrl];
        [self.queue addOperation:op];
    }
}


#pragma mark - Getter/Setter
-(NSMutableDictionary *)imageDict {
    if (!_imageDict) {
        _imageDict = [NSMutableDictionary dictionary];
    }
    return _imageDict;
}

-(NSMutableDictionary *)opertionDict {
    if (!_opertionDict) {
        _opertionDict = [NSMutableDictionary dictionary];
    }
    return _opertionDict;
}

-(NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc]init];
    }
    return _queue;
}

@end
