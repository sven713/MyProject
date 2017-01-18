//
//  main.m
//  test
//
//  Created by sven on 16/10/26.
//  Copyright © 2016年 sven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Child.h"

int main(int argc, char * argv[]) {
    
    Child *child = [[Child alloc]init];
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


//(Child) $0 = {
//    Father = (_father = 0)
//    _child = 0
//}
