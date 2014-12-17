//
//  UserContact.m
//  Runtime
//
//  Created by guafei on 14/12/17.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "UserContact.h"
#import "ORM.h"

@implementation UserContact

@synthesize userId, name, phone, address;

+ (NSString *)shortName {
    return @"uc";
}

+ (void)load {
    [ORM registerClass:[self class] withName:[self shortName]];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"UserId: %d\nName: %@\nPhone: %@\nAdress: %@\n", userId, name, phone, address];
}

@end
