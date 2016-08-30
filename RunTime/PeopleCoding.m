//
//  PeopleCoding.m
//  RunTime
//
//  Created by tianXin on 16/8/29.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import "PeopleCoding.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation PeopleCoding

- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0 ; i < count; i ++) {
        Ivar ivar = ivars[i];
        const char *ivarName = ivar_getName(ivar);
        NSString *strName = [NSString stringWithUTF8String:ivarName];
        id value = [self valueForKey:strName];
        [aCoder encodeObject:value forKey:strName];
    }
    free(ivars);
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        unsigned count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0 ; i < count; i ++) {
            Ivar ivar = ivars[i];
            const char *ivarName = ivar_getName(ivar);
            NSString *strName = [NSString stringWithUTF8String:ivarName];
           id value = [aDecoder decodeObjectForKey:strName];
            [self setValue:value forKey:strName];
        }
        free(ivars);
    }
    return self;
}

#pragma -mark 对象归档
- (void)archiverToFile:(NSString *)fileName{                        //对象归档保存
    NSString *fullPath = [self getDocumentsPath:fileName];
    [NSKeyedArchiver archiveRootObject:self toFile:fullPath];
}

- (id)unArchiverFromFile:(NSString *)fileName{                      //反归档对象
    NSString *fullPath = [self getDocumentsPath:fileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath]){
        id model = [NSKeyedUnarchiver unarchiveObjectWithFile: fullPath];
        return model;
    }else{
        return nil;
    }
}
#pragma -mark 辅助方法
- (NSString *)getDocumentsPath:(NSString *)fileName{          //获取文档目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [paths objectAtIndex:0];
    return [docPath stringByAppendingPathComponent:fileName];
}


@end
