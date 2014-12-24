//
//  MyProxy.h
//  Runtime
//
//  Created by guafei on 14/12/16.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RealSubject.h"

@interface MyProxy : NSProxy

@property (nonatomic, strong) RealSubject *object;

- (id)transformToObject:(NSObject *)anObject;

@end
