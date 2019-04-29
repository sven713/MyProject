//
//  Transform3DViewController.m
//  test
//
//  Created by 宋锡铭 on 2019/4/29.
//  Copyright © 2019 sven. All rights reserved.
//

#import "Transform3DViewController.h"

@interface Transform3DViewController ()
@property (assign, nonatomic) float width;
@property (assign, nonatomic) float height;
@end

@implementation Transform3DViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, 60, 60)];
    [self.view addSubview:backBtn];
    backBtn.backgroundColor = [UIColor orangeColor];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.view.frame.size.width > self.view.frame.size.height) {
        self.width = self.view.frame.size.width;
        self.height = self.view.frame.size.height;
    } else {
        self.width = self.view.frame.size.height;
        self.height = self.view.frame.size.width;
    }
    
//    [self initUI];
    
    
    [self gxRotateTest];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initUI {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIImageView * newImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth / 2.0, screenHeight * 2)];
    newImageView.image=[UIImage imageNamed:@"fastGameRaceTrackBackground"];
    [self.view addSubview:newImageView];
    
    CATransform3D trans = CATransform3DIdentity;
    trans.m34 = -1/1000.0;
    trans = CATransform3DRotate(trans, M_PI/4, 1, 0, 0);
    newImageView.layer.transform =trans;
}

- (void)gxRotateTest {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIImageView * newImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, screenHeight - screenHeight * 5.625, screenWidth, screenHeight * 2 * 5.625)];
    newImageView.image=[UIImage imageNamed:@"fastGameRaceTrackBackground"];
    [self.view addSubview:newImageView];
    
    CATransform3D rotate = CATransform3DMakeRotation(M_PI / 50, 1, 0, 0);
    newImageView.layer.transform = CATransform3DPerspect(rotate, CGPointMake(0, 0), 70);
}

#pragma mark - 关于3D旋转
// http://www.cocoachina.com/bbs/read.php?tid=117061
CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    //中心点
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    //从后边看
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    //初始化一个transform
    CATransform3D scale = CATransform3DIdentity;
    //根据m34(透视效果，要操作的这个对象要有旋转的角度，否则没有效果。正直/负值都有意义）的效果来观察。
    scale.m34 = -1.0f/disZ;
    //首先从中心点=>初始状态=>改变后面 //Concat就是将视图连接起来观察
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}

@end
