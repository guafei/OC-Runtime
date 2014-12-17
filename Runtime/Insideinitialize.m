//
//  Insideinitialize.m
//  Runtime
//
//  Created by guafei on 14/12/17.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "Insideinitialize.h"

@implementation SuperClass

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void) load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end

@implementation ChildClass

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
    Insideinitialize * obj = [[Insideinitialize alloc] init];
    [obj objectMethod];
    [obj release];
}

@end

@implementation Insideinitialize

- (void)objectMethod {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void) load {
    NSLog(@"%s", __FUNCTION__);
}

@end
