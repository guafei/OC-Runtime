//
//  RealSubject.m
//  Runtime
//
//  Created by guafei on 14/12/16.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "RealSubject.h"

@implementation RealSubject

- (void)fun
{
    // 这个方法需要代理进行惰性调用
    // Do something real
}

- (void)otherFun
{
    // 这个方法不需要代理做任何处理，可直接被调用
    // Do something real
}

@end
