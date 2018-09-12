//
//  CoreDataShareManage.m
//  coreDataDemo
//
//  Created by gaobin on 2018/9/12.
//  Copyright © 2018年 CXZ. All rights reserved.
//

#import "CoreDataShareManage.h"

@interface CoreDataShareManage()


@end

@implementation CoreDataShareManage

+ (instancetype)sharedManage {
    static CoreDataShareManage *coreDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (coreDataManager == nil) {
            coreDataManager = [[super allocWithZone:NULL] init];
        }
    });
    return coreDataManager;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedManage];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}





@end
