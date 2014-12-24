//
//  MyProxy.m
//  Runtime
//
//  Created by guafei on 14/12/16.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "MyProxy.h"

@implementation MyProxy

- (void)fun
{
    // Do someting virtual
    // 先做一些代理工作，然后创建一个后台线程，在后台线程中再调用真正的[object fun];
}

// Stupid transform implementation just by assigning a passed in object as transformation target. You can write your factory here and use passed in object as id for object that need ot be created.
- (id)transformToObject:(NSObject *)anObject
{
    if(self.object == anObject)
    {
        return self.object;
    }
    
    return anObject;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    if (self.object != nil) {
        [invocation setTarget:self.object];
        [invocation invoke];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *result;
    if (self.object != nil) {
        result = [self.object methodSignatureForSelector:sel];
    } else {
        // Will throw an exception as default implementation
        result = [super methodSignatureForSelector:sel];
    }
    return result;
}

@end
