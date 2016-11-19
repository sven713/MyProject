//
//  KVOCat.m
//  test
//
//  Created by sven on 16/11/19.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "KVOCat.h"

@implementation KVOCat
- (void)setName:(NSString *)name {
//    _name = name;
    _name = [name copy];
}

- (NSString *)speak:(NSString *)something {
    NSLog(@"%@",something);
    return @"Cat speaks somthing.";
}

@end
