//
//  AXFoodInfo.m
//  Powr
//
//  Created by guo on 2018/1/2.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

#import "AXFoodInfo.h"

@implementation AXFoodInfo
+(instancetype)foodWithDiction:(NSDictionary *)dict{
    
    AXFoodInfo *foodInfo = [[self alloc]init];
    
//    方法1:方法比较垃圾，属性多的时候复杂度比较高
    foodInfo.tilte = dict[@"tilte"];
    foodInfo.total = dict[@"total"];
    foodInfo.icon = dict[@"icon"];
    foodInfo.detail = dict[@"detail"];
    
//    方法2:KVC---通过key设置value值
    [foodInfo setValuesForKeysWithDictionary:dict];
    
    
//    方法3:runtime

    
    
    return foodInfo;
}



@end
