//
//  KVOCat.h
//  test
//
//  Created by sven on 16/11/19.
//  Copyright © 2016年 sven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVOCat : NSObject
@property (nonatomic, copy) NSString *name;

- (NSString *)speak:(NSString *)something;

@end
