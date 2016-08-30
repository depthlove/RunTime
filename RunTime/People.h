//
//  People.h
//  RunTime
//
//  Created by tianXin on 16/8/29.
//  Copyright © 2016年 tianXin. All rights reserved.
//  获取属性







/**
 *  获取属性,变量，方法
 */

#import <Foundation/Foundation.h>

@interface People : NSObject
{
    NSString *_occupation;
    NSString *_nationality;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSUInteger age;

- (NSDictionary *)allProperties;
- (NSDictionary *)allIvars;
- (NSDictionary *)allMethods;
@end
