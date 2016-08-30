//
//  People.m
//  RunTime
//
//  Created by tianXin on 16/8/29.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import "People.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else

#endif

@implementation People

- (NSDictionary *)allProperties{
    unsigned count = 0;
    // 获取类的所有属性，如果没有属性count就为0
    objc_property_t *property_t = class_copyPropertyList([self class], &count);
    NSMutableDictionary *propertyDict = [[NSMutableDictionary alloc] init];;
    for (int i = 0 ; i < count; i ++) {
        // 获取属性的名称和值
        const char *propertyName = property_getName(property_t[i]);
        NSString *strName = [NSString stringWithUTF8String:propertyName];
        id value = [self valueForKey:strName];
        if (value) {
            [propertyDict setObject:value forKey:strName];
        }else{
            [propertyDict setObject:@"nil" forKey:strName];
        }
    }
    // 这里properties是一个数组指针，我们需要使用free函数来释放内存。
    free(property_t);
    return propertyDict;
}


- (NSDictionary *)allIvars{
    unsigned count = 0;
    NSMutableDictionary *ivarsDict = [[NSMutableDictionary alloc] init];;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0 ; i < count;  i++) {
        const char *ivarName = ivar_getName(ivars[i]);
        NSString *strName = [NSString stringWithUTF8String:ivarName];
        id value = [self valueForKey:strName];
        if (value) {
            [ivarsDict setObject:value forKey:strName];
        }else{
            [ivarsDict setObject:@"nil" forKey:strName];
        }
    }
    free(ivars);
    return ivarsDict;
}


- (NSDictionary *)allMethods{
    unsigned count = 0 ;
    // 获取类的所有方法，如果没有方法count就为0
    NSMutableDictionary *methodDict = [[NSMutableDictionary alloc] init];
    Method *methods = class_copyMethodList([self class], &count);
    for (int i = 0 ; i < count; i ++) {
        // 获取方法名称
        SEL mothodSEL = method_getName(methods[i]);
        const char *mothodName = sel_getName(mothodSEL);
        NSString *name = [NSString stringWithUTF8String:mothodName];
        
        // 获取方法的参数列表
        int arguments = method_getNumberOfArguments(methods[i]);
        methodDict[name] = @(arguments - 2);
    }
    free(methods);
    return methodDict;
}

@end
