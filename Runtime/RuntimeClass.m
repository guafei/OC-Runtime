//
//  RuntimeClass.m
//  Runtime
//
//  Created by guafei on 14-11-3.
//  Copyright (c) 2014年 guafei. All rights reserved.
//

#import "RuntimeClass.h"
#include <objc/runtime.h>
#include <objc/objc.h>

/**************************************************************************************
 **************************************************************************************
 
        @interface NSObject <NSObject> {
            Class isa  OBJC_ISA_AVAILABILITY;
        }

        typedef struct objc_class *Class;
 
        struct objc_class {
            Class isa  OBJC_ISA_AVAILABILITY;  (MetaClass  class_pointer)
 
            #if !__OBJC2__
            Class super_class                                        OBJC2_UNAVAILABLE;
            const char *name                                         OBJC2_UNAVAILABLE;
            long version                                             OBJC2_UNAVAILABLE;
            long info                                                OBJC2_UNAVAILABLE;
            long instance_size                                       OBJC2_UNAVAILABLE;
            struct objc_ivar_list *ivars                             OBJC2_UNAVAILABLE;
            struct objc_method_list **methodLists                    OBJC2_UNAVAILABLE;
            struct objc_cache *cache                                 OBJC2_UNAVAILABLE;
            struct objc_protocol_list *protocols                     OBJC2_UNAVAILABLE;
            #endif
        }
 
**************************************************************************************
**************************************************************************************/

@implementation RuntimeClass

- (void)initClass
{
    Class newClass = objc_allocateClassPair([NSError class], "RuntimeErrorSubclass", 0);
    class_addMethod(newClass, @selector(report), (IMP)ReportFunction, "v@:");
    objc_registerClassPair(newClass);
    
    id instanceOfNewClass = [[newClass alloc] initWithDomain:@"someDomain" code:0 userInfo:nil];
    [instanceOfNewClass performSelector:@selector(report)];
    
//    runtimeClassTest();
    classCheck();
}

void ReportFunction(id self, SEL _cmd)
{
    NSLog(@"This object is %p.", self);
    NSLog(@"Class is %@, and super is %@.", [self class], [self superclass]);
    
    Class currentClass = [self class];
    for (int i = 1; i < 5; i++)
    {
        NSLog(@"Following the isa pointer %d times gives %p. >>>>>>>>>>  currentClass is %@", i, currentClass,currentClass);
        //Returns the class of an object.
        currentClass = object_getClass(currentClass);
        //meta-class 是 Class 对象的类，每个 Class 都有个不同的自己的 meta-class（因此每个 Class 都可以有一个自己不同的方法列表）
        //一层循环打印 RuntimeErrorSubclass 然后获取对象的类，也就是RuntimeErrorSubclass
    }
    
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's meta class is %p", object_getClass([NSObject class]));
}

void runtimeClassTest()
{
    NSObject *observer = [NSObject new];
    NSObject *model = [NSObject new];
    
    [model addObserver: observer forKeyPath: @"count" options: 0 context: NULL];
    
    //using -class methods:
    NSLog(@"model is a %@, observer is a %@", [model class], [observer class]);
    
    //casting to Class:
    NSLog(@"model is a %@, observer is a %@", *(Class*)CFBridgingRetain(model), *(Class*)CFBridgingRetain(observer));
    
    //using the runtime:
    NSLog(@"model is a %@, observer is a %@", object_getClass(model), object_getClass(observer));
    
    [model removeObserver: observer forKeyPath: @"count" context: NULL];
    
    CFBridgingRelease((__bridge CFTypeRef)(model));
    CFBridgingRelease((__bridge CFTypeRef)(observer));
}

void classCheck()
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    [arr addObject:[NSObject class]];
    [arr addObject:[NSValue class]];
    [arr addObject:[NSNumber class]];
    [arr addObject:[NSPredicate class]];
    [arr addObject:@"not a class object"];
    
    for (int i = 0 ; i<[arr count]; i++) {
        id obj = [arr objectAtIndex:i];
        
        //metaclass is the class of an object, use object_getClass to get metaclass
        //[xxx class] return class not metaclass
//        if(class_isMetaClass(object_getClass(obj)))
//        {
//            NSLog(@"Class: %@", obj);
//        }
//        else
//        {
//            NSLog(@"Instance: %@", obj);
//        }
        
        //Returns a Boolean value that indicates whether the receiver is an instance of
        //given class or an instance of any class that inherits from that class.
        if ([obj isKindOfClass:[NSObject class]])
        {
            NSLog(@"Class isKindOfClass of: %@", obj);
        }
        
        //Returns a Boolean value that indicates whether the receiver is an instance of a given class.
        if([obj isMemberOfClass:[NSObject class]])
        {
            //will never called
            NSLog(@"Class isMemberOfClass of : %@", obj);
        }
    }
    
    NSObject *object = [[NSObject alloc] init];
    if([object isMemberOfClass:[NSObject class]])
    {
        NSLog(@"Class isMemberOfClass of : %@", object);
    }
}

@end






