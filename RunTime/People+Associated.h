//
//  People+Associated.h
//  RunTime
//
//  Created by tianXin on 16/8/29.
//  Copyright © 2016年 tianXin. All rights reserved.
//




/**
 *  类别添加属性
 *
 *  @return 
 */

#import "People.h"

typedef void(^CodingCallBack)();

@interface People (Associated)

@property (nonatomic, strong) NSNumber *associatedBust; // 胸围
@property (nonatomic, copy) CodingCallBack associatedCallBack;  // 写代码

@end
