//
//  UserContact.h
//  Runtime
//
//  Created by guafei on 14/12/17.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserContact : NSObject

@property (nonatomic) int userId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *address;
+ (NSString *)shortName;

@end
