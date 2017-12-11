//
//  Teacher.m
//  Powr
//
//  Created by guo on 2017/12/3.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "Teacher.h"
#import <objc/message.h>

@implementation Teacher

//告诉系统要归档哪些属性
- (void)encodeWithCoder:(NSCoder *)coder
{
    
    //通过for循环达到自动归档所有的属性
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([Teacher class], &count);
    
    for (int i = 0; i < count;  i++) {
        //拿到每一个成员变量
        Ivar ivar = ivars[i];
        //拿名称
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //归档---利用kvo
        id value = [self valueForKey:key];
        [coder encodeObject:value forKey:key];
    }
    free(ivars);
//    原始方法
//    [coder encodeObject:_name forKey:@"name"];
//    [coder encodeInt:_age forKey:@"age"];
}


//告诉系统要解档哪些数据
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        
        
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([Teacher class], &count);
        
        for (int i = 0; i < count;  i++) {
            //拿到每一个成员变量
            Ivar ivar = ivars[i];
            //拿名称
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            //解档---利用kvo
            id value = [coder decodeObjectForKey:key];
            //利用kvo设置值
            [self setValue:value forKey:key];
            
        }
        free(ivars);
//    原始方法
//        _name = [coder decodeObjectForKey:@"name"];
//        _age = [coder decodeIntForKey:@"name1"];
    }
    return self;
}
@end
