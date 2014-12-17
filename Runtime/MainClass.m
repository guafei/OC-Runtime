//
//  MainClass.m
//  Runtime
//
//  Created by guafei on 14/12/17.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "MainClass.h"

@implementation MainClass(Category)

+ (void) load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end

@implementation MainClass(OtherCategory)

+ (void) load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end

/******* Implementation *******/
@implementation MainClass

+ (void) load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end