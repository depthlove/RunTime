//
//  PeopleJason.m
//  RunTime
//
//  Created by tianXin on 16/8/30.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import "PeopleJason.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation PeopleJason

// 生成model
- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    if (self = [super init]) {
        for (NSString *key in dictionary.allKeys) {
            id value = dictionary[key];
            SEL setter = [self propertySetterByKey:key];
            if (setter) {
                ((void(*)(id,SEL,id))objc_msgSend)(self,setter,value);
            }
        }
    }
    return self;
}

// 转换成字典
- (NSDictionary *)covertToDictionary{
    unsigned count = 0;
    objc_property_t *property = class_copyPropertyList([self class], &count);
    NSMutableDictionary *mudict = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < count; i ++) {
        const char *propertyName = property_getName(property[i]);
        NSString *strName = [NSString stringWithUTF8String:propertyName];
        SEL getter = [self propertyGetterByKey:strName];
        if (getter) {
            id value = ((id(*)(id,SEL))objc_msgSend)(self,getter);
            [mudict setObject:value forKey:strName];
        }
    }
    return mudict;
}


#pragma mark - private methods
// 生成setter方法
- (SEL)propertySetterByKey:(NSString *)key
{
    // 首字母大写，你懂得
    NSString *propertySetterName = [NSString stringWithFormat:@"set%@:", key.capitalizedString];
    
    SEL setter = NSSelectorFromString(propertySetterName);
    if ([self respondsToSelector:setter]) {
        return setter;
    }
    return nil;
}

// 生成getter方法
- (SEL)propertyGetterByKey:(NSString *)key
{
    SEL getter = NSSelectorFromString(key);
    if ([self respondsToSelector:getter]) {
        return getter;
    }
    return nil;
}


@end
