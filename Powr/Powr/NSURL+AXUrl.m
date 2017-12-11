//
//  NSURL+AXUrl.m
//  Powr
//
//  Created by guo on 2017/12/11.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

/**
runtime运行时
 苹果专门给开发者提供了一套运行时的库<objc/runtime>
 runtime属于oc底层实现，可以进行一些oc无法操作的高级功能
 1，利用runtime能够在程序运行的过程中动态的创建一个对象
 2，利用runtime能够在程序运行的过程中动态的修改一个对象的（属性/方法）
 3，利用runtime能够拿到一个对象的所有属性和方法
 
*/
#import "NSURL+AXUrl.h"
#import <objc/message.h>

@implementation NSURL_AXUrl

//利用runtime做方法交换
+(void)load{
    
//    拿到方法
    Method  URLWithString = class_getClassMethod([NSURL class], @selector(URLWithString:));

    Method  AXURLWithString = class_getClassMethod([NSURL class], @selector(AXURLWithString:));

//    交换
    method_exchangeImplementations(URLWithString, AXURLWithString);
}


//自定义的方法实现
+(instancetype)AXURLWithString:(NSString *)string{
    
//    利用系统的方法创建
    NSURL *url = [self AXURLWithString:string];
    if (!url) {
        NSLog(@"url为空");
    }
    
    return self;
    
}

@end
