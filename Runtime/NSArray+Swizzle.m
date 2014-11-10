//
//  NSArray+Swizzle.m
//  Runtime
//
//  Created by guafei on 14-11-3.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "NSArray+Swizzle.h"
#import "@Selector_Nil.h"
#import <objc/runtime.h>
#import "ForwardingClassTwo.h"

@implementation NSArray (Swizzle)

- (id)myLastObject
{
    id ret = [self myLastObject];
    NSLog(@"**********  myLastObject *********** ");
    return ret;
}

@end
