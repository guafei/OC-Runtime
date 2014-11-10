//
//  ForwardingClassTwo.m
//  Runtime
//
//  Created by guafei on 14-11-3.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "ForwardingClassTwo.h"
#import "ForwardingClassOne.h"
#include <objc/runtime.h>

@implementation ForwardingClassTwo

@dynamic dynamicValue;

//判断是否动态的添加了该方法
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
//    return NO;
    BOOL add_method = NO;
    if( sel == @selector(functionOne))
    {
        add_method = class_addMethod([ForwardingClassTwo class],sel,(IMP)dynamicMethodIMP,"v@:");
    }else if(sel == @selector(setDynamicValue:))
    {
        add_method = class_addMethod([ForwardingClassTwo class],sel,(IMP)dynamicMethodIMP,"v@:");
    }
    
    return add_method;
}

//快速消息分发
- (id)forwardingTargetForSelector:(SEL)aSelector
{
//    return nil;
    
    ForwardingClassOne *one = [[ForwardingClassOne alloc]init];
    if ([one respondsToSelector:aSelector]) {
        return one;
    }
    return nil;
}

//标准消息分发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    ForwardingClassOne *forwardingOne = [[ForwardingClassOne alloc] init];
    NSMethodSignature* signature = [super methodSignatureForSelector:aSelector];
    if (signature==nil) {
        signature = [forwardingOne methodSignatureForSelector:aSelector];
    }
    NSUInteger argCount = [signature numberOfArguments];
    for (NSInteger i=0 ; i<argCount ; i++) {
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    //这边可以定义方法找不到，默认的操作
    ForwardingClassOne *forwardingOne = [[ForwardingClassOne alloc] init];
    SEL seletor = [anInvocation selector];
    if ([forwardingOne respondsToSelector:seletor]) {
        [anInvocation invokeWithTarget:forwardingOne];
    }
}

- (void)initValue
{
    //oc 不建议手动调用objc_msgSend，它由编译器生成
    NSString *str = objc_msgSend(objc_getClass("NSString"), sel_getUid("stringWithString:"), @"Test");
    NSLog(@"str is %@",str);
}

- (void)hasFunction
{
    NSLog(@"hasFunction is called ,will not call dynamicMethod");
}

void dynamicMethodIMP(id self, SEL _cmd)
{
    NSLog(@"dynamicMethodIMP called !");
}


@end
