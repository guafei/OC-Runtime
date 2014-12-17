//
//  ORM.h
//  Runtime
//
//  Created by guafei on 14/12/17.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ORM : NSObject {
    NSMutableDictionary *mapper;
}

+ (ORM*)instance;
+ (void)registerClass:(Class) class withName:(NSString*) className;

- (id)getObjectWithData:(NSDictionary *)dataDict;

@end
