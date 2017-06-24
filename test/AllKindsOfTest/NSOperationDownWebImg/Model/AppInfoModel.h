//
//  AppInfoModel.h
//  test
//
//  Created by sven on 17/6/11.
//  Copyright © 2017年 sven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfoModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *download;
+ (instancetype)initWithDict:(NSDictionary *)dict;
@end
