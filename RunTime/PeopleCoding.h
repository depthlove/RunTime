//
//  PeopleCoding.h
//  RunTime
//
//  Created by tianXin on 16/8/29.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PeopleCoding : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name; // 姓名
@property (nonatomic, strong) NSNumber *age; // 年龄
@property (nonatomic, copy) NSString *occupation; // 职业
@property (nonatomic, copy) NSString *nationality; // 国籍

- (void)archiverToFile:(NSString *)fileName;        //归档
- (id)unArchiverFromFile:(NSString *)fileName;      //反归档
@end
