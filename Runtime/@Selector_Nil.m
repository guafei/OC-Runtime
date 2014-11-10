//
//  @Selector_Nil.m
//  Runtime
//
//  Created by guafei on 14-11-3.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "@Selector_Nil.h"
#include <objc/runtime.h>
#include <objc/message.h>

@implementation _Selector_Nil

- (void) :(id)obj
{
    NSLog(@"nil selector is called");
}

@end
