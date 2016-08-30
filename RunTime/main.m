//
//  main.m
//  RunTime
//
//  Created by tianXin on 16/8/29.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "People.h"
#import "PeopleCoding.h"
#import "PeopleJason.h"
#import "PeopleSing.h"
#import "BordSing.h"
#import "PeopleDance.h"

#if TARGET_IPHONE_SIMULATOR

#import <objc/objc-runtime.h>

#else

#import <objc/runtime.h>
#import <objc/message.h>

#endif

//void sayFunction(id self,SEL _cmd,id some){
//    NSLog(@"%@,%@,%@",[self valueForKey:@"_name"], object_getIvar(self, class_getInstanceVariable([self class], "_age")),some);
//}
//
//int main(int argc, char * argv[]) {
//    @autoreleasepool {
////        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//          //创建一个继承自NSObject
//        Class People = objc_allocateClassPair([NSObject class], "Person", 0);
//         //添加成员变量name 与 age
//        class_addIvar(People, "_name", sizeof(NSString*), log2(sizeof(NSString*)), @encode(NSString *));
//        class_addIvar(People, "_age", sizeof(int), sizeof(int), @encode(int));
//        //注册方法
//        SEL s = sel_registerName("say:");
//       //添加方法给类
//         class_addMethod(People, s,(IMP)sayFunction , "v@:@");
//        //注册该类
//        objc_registerClassPair(People);
//        // 创建一个类的实例
//        id personInstance = [[People alloc] init];
//        // KVC 动态改变 对象peopleInstance 中的实例变量
//        [personInstance setValue:@"宝宝" forKey:@"name"];
//        [personInstance setValue:@22 forKey:@"age"];
//        //从类中获取成员变量Ivar
//        Ivar perVar = class_getInstanceVariable(People, "_age");
//        // 为peopleInstance的成员变量赋值
//        object_setIvar(personInstance, perVar, @22);
//        ((void (*)(id, SEL, id))objc_msgSend)(personInstance, s, @"大家好");
//        //当People类或者它的子类的实例还存在，则不能调用objc_disposeClassPair这个方法；因此这里要先销毁实例对象后才能销毁类；
//        personInstance = nil;
//        // 销毁类
//        objc_disposeClassPair(People);
//        return 0;
//    }
//}


//
//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        People *person = [[People alloc] init];
//        person.name = @"张卜丹";
//        person.age = 22;
//        [person setValue:@"汉中" forKey:@"occupation"];
//        [person setValue:@"洋县" forKey:@"nationality"];
//
//        NSDictionary *property = [person allProperties];
//        NSDictionary *iver     = [person allIvars];
//        NSDictionary *methods  = [person allMethods];
//        
//        for (NSString *propertyName in property.allKeys) {
//            NSLog(@"property%@  :  propertyValue%@\n",propertyName,property[propertyName]);
//        }
//        
//        for (NSString *ivarName in iver.allKeys) {
//            NSLog(@"iver%@  : iverValue%@\n",ivarName,iver[ivarName]);
//        }
//        
//        for (NSString *methodName in methods.allKeys) {
//            NSLog(@"methodName%@   :    methodName%@\n",methodName,methods[methodName]);
//        }
//        
//        return 0;
//    }
//}


//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        PeopleCoding *coding = [[PeopleCoding alloc] init];
//        [coding archiverToFile:@"coding"];
//        return 0;
//    }
//}


//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        NSDictionary *dict = @{@"name":@"宝宝",
//                               @"age":@"22",
//                               @"occupation":@"律师",
//                               @"nationality":@"陕西"
//                               };
//        PeopleJason *teacher = [[PeopleJason alloc] initWithDictionary:dict];
//        NSLog(@"\n%@\n%@\n%@\n%@",teacher.name,teacher.age,teacher.occupation,teacher.nationality);
//        
//        NSDictionary *d = [teacher covertToDictionary];
//        NSLog(@"%@",d);
//        return 0;
//    }
//}


//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        PeopleSing *sing = [[PeopleSing alloc] init];
//        sing.name = @"宝宝";
//        [sing sing];
//        return 0;
//    }
//}


//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        BordSing *sing = [[BordSing alloc] init];
//        sing.name = @"宝宝";
//        ((void(*)(id ,SEL))objc_msgSend)((id)sing,@selector(sing));
//        return 0;
//    }
//}
//


int main(int argc, char * argv[]) {
    @autoreleasepool {
        PeopleDance *sing = [[PeopleDance alloc] init];
        ((void(*)(id ,SEL))objc_msgSend)((id)sing,@selector(sing));
        return 0;
    }
}

