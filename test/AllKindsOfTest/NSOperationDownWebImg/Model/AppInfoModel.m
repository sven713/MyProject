//
//  AppInfoModel.m
//  test
//
//  Created by sven on 17/6/11.
//  Copyright © 2017年 sven. All rights reserved.
//

#import "AppInfoModel.h"

@implementation AppInfoModel
+ (instancetype)initWithDict:(NSDictionary *)dict {
    AppInfoModel *model = [[AppInfoModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
@end
