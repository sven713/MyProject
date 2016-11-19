//
//  KVOTestViewController.m
//  test
//
//  Created by sven on 16/11/19.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "KVOTestViewController.h"
#import "KVOCat.h"

@interface KVOTestViewController ()
@property (nonatomic, strong) UIButton *reSizeBtn; //!<变化形状的btn
@property (nonatomic, strong) KVOCat *cat;
@end

@implementation KVOTestViewController

-(instancetype)init {
    if (self = [super init]) {
        self.cat = [KVOCat new];
        NSLog(@"%@",[self.cat speak:@"i am a cat."]); // 输出 i am a cat. cat speak something
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    
//    [self addObserver:self.reSizeBtn forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    // 上面的写法是错误的, 是对象添加观察者 必须在dealloc里面移除,否则会崩溃
//    [self.reSizeBtn addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionPrior context:nil];
    
    [self.cat addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)configUI {
    self.title = @"KVO test";
    
    self.reSizeBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.reSizeBtn.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:self.reSizeBtn];
    [self.reSizeBtn setTitle:@"我会变形" forState:UIControlStateNormal];
    
    UIButton *enLargeBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 80, 50)];
    [self.view addSubview:enLargeBtn];
    [enLargeBtn setTitle:@"变大-改名字" forState:UIControlStateNormal];
    [enLargeBtn addTarget:self action:@selector(enlarge) forControlEvents:UIControlEventTouchUpInside];
    enLargeBtn.backgroundColor = [UIColor orangeColor];
    
    UIButton *smallBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 300, 80, 50)];
    [self.view addSubview:smallBtn];
    [smallBtn setTitle:@"变小-改名字" forState:UIControlStateNormal];
    [smallBtn addTarget:self action:@selector(smallBtn) forControlEvents:UIControlEventTouchUpInside];
    smallBtn.backgroundColor = [UIColor orangeColor];
    
    self.cat = [KVOCat new];
    self.cat.name = @"helloKity";
}

- (void)enlarge {
    [UIView animateWithDuration:0.2 animations:^{
        self.reSizeBtn.frame = CGRectMake(100, 100, 150, 130);
    }];
    
    self.cat.name = @"hello";
}

- (void)smallBtn {
    [UIView animateWithDuration:0.2 animations:^{
        self.reSizeBtn.frame = CGRectMake(100, 100, 100, 100);
    }];
    self.cat.name = @"kitty";
}

-(void)didChangeValueForKey:(NSString *)key {
    NSLog(@"按钮frame变化了");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"----->按钮frame变化了");
    
    NSLog(@"名字改了--%@",self.cat.name);
}

- (void)dealloc {
//    [self removeObserver:self.reSizeBtn forKeyPath:@"frame"];
//    [self.reSizeBtn removeObserver:self forKeyPath:@"frame"];
    [self.cat removeObserver:self forKeyPath:@"name"];
    NSLog(@"kvo被释放了");
}

@end
