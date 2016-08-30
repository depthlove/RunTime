//
//  People+Associated.m
//  RunTime
//
//  Created by tianXin on 16/8/29.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import "People+Associated.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation People (Associated)
- (void)setAssociatedBust:(NSNumber *)associatedBust{
    
    objc_setAssociatedObject(self, @selector(associatedBust), associatedBust, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)associatedBust{
    return objc_getAssociatedObject(self, @selector(associatedBust));
}

- (void)setAssociatedCallBack:(CodingCallBack)associatedCallBack{
    objc_setAssociatedObject(self, @selector(associatedCallBack), associatedCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CodingCallBack)associatedCallBack{
    return objc_getAssociatedObject(self, @selector(associatedCallBack));
}
@end
