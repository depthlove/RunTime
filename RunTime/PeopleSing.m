//
//  PeopleSing.m
//  RunTime
//
//  Created by tianXin on 16/8/30.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import "PeopleSing.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif
@implementation PeopleSing

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    // 我们没有给People类声明sing方法，我们这里动态添加方法
    if ([NSStringFromSelector(sel) isEqualToString:@"sing"]) {
        class_addMethod(self, sel, (IMP)otherSing, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void otherSing(id self, SEL sel){
    NSLog(@"%@ 唱歌啦！",((PeopleSing *)self).name);
}
@end
