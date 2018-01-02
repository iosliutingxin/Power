//
//  AXFoodInfo.h
//  Powr
//
//  Created by guo on 2018/1/2.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AXFoodInfo : NSObject
@property(nonatomic,copy)NSString *tilte; /**商品名称*/
@property(nonatomic,copy)NSString *total; /**商品数量*/
@property(nonatomic,copy)NSString *icon; /**商品名称*/
@property(nonatomic,copy)NSString *detail;/**商品详情*/
//给我一个字典我返回你一个模型
+(instancetype)foodWithDiction:(NSDictionary *)dict;
@end
