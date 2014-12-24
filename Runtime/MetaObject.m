//
//  MetaObject.m
//  Runtime
//
//  Created by guafei on 14/12/24.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "MetaObject.h"

@implementation MetaObject

- (instancetype)initMetaObject_TestingMetaMacro
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    [self __init];
    return self;
}

- (void)__init
{
    //可变宏 ...和__VA_ARGS__
    //实现思想就是宏定义中参数列表的最后一个参数为省略号（也就是三个点）。这样预定义宏__VA_ARGS__就可以被用在替换部分中，以表示省略号代表什么
    
    //metamacro_argcount explain: http://www.cocoachina.com/industry/20140621/8905.html
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused"
    NSLog(@"metamacro_exprify value is %d",metamacro_exprify(6,3,5));//.eg ((1,2,3),4) will cause compile warning
#pragma clang diagnostic pop

    NSLog(@"metamacro_stringify value is %s",metamacro_stringify(34235));//metamacro_stringify value is 34235
    NSLog(@"metamacro_concat value is %d",metamacro_concat(3,4));//metamacro_concat value is 34
    NSLog(@"metamacro_at value is %d",metamacro_at(2,1,2,3,4));//confused? arguments count should greater than (first argument + 1)
    NSLog(@"metamacro_argcount value is %d",metamacro_argcount(1,2,3,4,5,6,7));//metamacro_argcount value is 7. count of arguments
    
    NSLog(@"metamacro_head value is %d",metamacro_head(6,2,3,4));//metamacro_head value is 6
    NSLog(@"metamacro_tail value is %d",metamacro_tail(8,9,4,5));//confused
}

@end
