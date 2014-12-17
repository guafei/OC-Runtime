//
//  ORM.m
//  Runtime
//
//  Created by guafei on 14/12/17.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "ORM.h"

@implementation ORM

+ (ORM *)instance  {
    static ORM *orm = nil;
    if (!orm) {
        orm = [[ORM alloc] init];
    }
    return orm;
}

+ (void)registerClass:(Class)class withName:(NSString *)className {
    ORM * orm = [self instance];
    [orm->mapper setObject:class forKey:className];
}

- (id)init {
    if ((self = [super init])) {
        mapper = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (id)getObjectWithData:(NSDictionary *)dataDict {
    NSString * classNames = [dataDict objectForKey:@"className"];
    Class class = [mapper objectForKey:classNames];
    if (!class) {
        return nil;
    }
    id obj = [[class alloc] init];
    for (NSString *key in dataDict) {
        if ([key isEqualToString:@"className"]) {
            continue;
        }
        
        [obj setValue:[dataDict objectForKey:key] forKey:key];
    }
    
    return [obj autorelease];
}

@end
