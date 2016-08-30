//
//  PeopleJason.h
//  RunTime
//
//  Created by tianXin on 16/8/30.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PeopleJason : NSObject

@property (nonatomic, copy) NSString *name; // 姓名
@property (nonatomic, strong) NSNumber *age; // 年龄
@property (nonatomic, copy) NSString *occupation; // 职业
@property (nonatomic, copy) NSString *nationality; // 国籍

// 生成model
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

// 转换成字典
- (NSDictionary *)covertToDictionary;

@end
