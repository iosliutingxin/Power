//
//  AXFoodInfoVC.m
//  Powr
//
//  Created by guo on 2018/1/2.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

//模型的应用
#import "AXFoodInfoVC.h"
#import "AXFoodInfo.h"
@interface AXFoodInfoVC ()
@property(nonatomic,strong)NSArray *foods;
@end

@implementation AXFoodInfoVC

//懒加载
-(NSArray *)foods{
    
    if (!_foods) {
        
        //从本地数据库中取出数据
        NSString *path = [[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        //可变数据存放模型
        NSMutableArray *arrs = [NSMutableArray array];
        
        //字典转模型
        for (NSDictionary *dict  in arr) {
            AXFoodInfo * foodinfo = [AXFoodInfo foodWithDiction:dict];
            [arrs addObject:foodinfo];
            
        }
        _foods = arrs;
    }
    
    
    return _foods;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}



@end
