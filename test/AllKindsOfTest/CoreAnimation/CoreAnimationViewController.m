//
//  CoreAnimationViewController.m
//  test
//  https://hit-alibaba.github.io/interview/iOS/Cocoa-Touch/Animation.html
//  Created by 宋锡铭 on 2021/7/27.
//  Copyright © 2021 sven. All rights reserved.
//

#import "CoreAnimationViewController.h"

@interface CoreAnimationViewController ()
@property (nonatomic, strong) CALayer *layer;

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIView *myView;
@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tap];
    
    // 2:38  3:00
    // CABasicAnimation
    // CATransition 转场动画
    // CAKeyFrame
    // CAGroupAnimation
    
    // 粒子效果
    // 3D物理效果
    // CADisplaylink
    
    // [self layer];
    
}

- (void)tapAction {
    //    [self CABasicAnimation]; // 基本动画
    //    [self CAKeyFrameTest]; // 关键帧动画
    //    [self CATransitionTest]; // 转场动画
    
    
    //    [self CAGroupAnimationFun]; // 组动画
    
    //     displaylink,  粒子效果
    
    [self gravity]; //物理效果,掉落
}

/// 转场动画
- (void)CATransitionTest{
    CATransition *trans = [[CATransition alloc]init];
    trans.duration = 3;
    trans.type = kCATransitionPush; //kCATransitionReveal;
    trans.subtype = kCATransitionFromTop; //必须有type然后再subType
    
    [self.layer addAnimation:trans forKey:@""];
}


/// 关键帧动画
- (void)CAKeyFrameTest {
    
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    
    NSValue *v1 = [NSNumber numberWithFloat:-M_PI / 180 * 4];
    NSValue *v2 = [NSNumber numberWithFloat:M_PI / 180 * 5];
    NSValue *v3 = [NSNumber numberWithFloat:-M_PI / 180 * 18];
    keyFrame.values = @[v1, v2, v3];
    keyFrame.keyTimes = @[@0,@0.6,@1];
    keyFrame.duration = 3;
    
    
    [self.layer addAnimation:keyFrame forKey:nil];
}

- (void)CABasicAnimation {
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position.x"];
    basic.toValue = @200;
    
    [self.layer addAnimation:basic forKey:nil];
}


- (void)CAGroupAnimationFun {
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position.x"];
    basic.toValue = @200;
    basic.duration = 3;
    
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    
    NSValue *v1 = [NSNumber numberWithFloat:-M_PI / 180 * 4];
    NSValue *v2 = [NSNumber numberWithFloat:M_PI / 180 * 5];
    NSValue *v3 = [NSNumber numberWithFloat:-M_PI / 180 * 18];
    keyFrame.values = @[v1, v2, v3];
    keyFrame.keyTimes = @[@0,@0.6,@1];
    keyFrame.duration = 3;
    
    group.animations = @[basic, keyFrame];
    group.duration = 3;
    [self.layer addAnimation:group forKey:nil];
}

- (void)gravity {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.myView]];
    [self.animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.myView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collisionBehavior];
}


-(CALayer *)layer {
    if(!_layer){
        _layer = [[CALayer alloc] init];
        _layer.frame = CGRectMake(0, 300, 100, 100);
        [self.view.layer addSublayer:_layer];
        _layer.backgroundColor = [UIColor sv_randomColor].CGColor; //颜色不设置显示不出来
    }
    return _layer;
}

-(UIView *)myView {
    if(!_myView){
        _myView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
        [self.view addSubview:_myView];
        _myView.backgroundColor = [UIColor sv_randomColor];
    }
    return _myView;
}

@end
