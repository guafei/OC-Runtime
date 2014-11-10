//
//  main.m
//  Runtime
//
//  Created by guafei on 14-11-3.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "NSArray+Swizzle.h"
#import "@Selector_Nil.h"
#import <objc/runtime.h>
#import "ForwardingClassOne.h"
#import "ForwardingClassTwo.h"
#import "RuntimeClass.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        //for exchange method
//        Method ori_Method =  class_getInstanceMethod([NSArray class], @selector(lastObject));
//        Method my_Method = class_getInstanceMethod([NSArray class], @selector(myLastObject));
//        method_exchangeImplementations(ori_Method, my_Method);
//        
//        NSArray *array = @[@"0",@"1",@"2",@"3"];
//        NSString *string = [array lastObject];
//        NSLog(@"TEST RESULT : %@",string);
        
        //for null params
//        _Selector_Nil *selector_nil = [[_Selector_Nil alloc] init];
//        [selector_nil :nil];
        
        //for message forwarding
//        ForwardingClassTwo *forwardungTwo = [[ForwardingClassTwo alloc] init];
//        [forwardungTwo initValue];
//        [forwardungTwo hasFunction];
//        [forwardungTwo setDynamicValue:20.0];
//        [(ForwardingClassOne *)forwardungTwo functionOne];
        
        RuntimeClass *runTime = [[RuntimeClass alloc] init];
        [runTime initClass];
        
        
        return 0;
    }

}





