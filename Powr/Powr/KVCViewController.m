//
//  KVOViewController.m
//  Powr
//
//  Created by guo on 2017/12/12.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "KVCViewController.h"
#import "person.h"
@interface KVCViewController ()
/**
 KVC”(全称：Key－Value－Coding，键值编码)。
 通过字符串来自动找到要更改的对象属性
 */
@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    方法1
    person *per = [[person alloc]init];
    [per setValue:@"Jim" forKey:@"name"];
    [per setValue:[NSNumber numberWithInt:20] forKey:@"age"];
    [per setValue:[NSNumber numberWithBool:YES] forKey:@"sex"];
    
     NSLog(@"The person's name is :%@,and age is :%d, sex is :%d",per.name,per.age,per.sex);
    
    
//    方法2
    NSMutableDictionary * dic=[[NSMutableDictionary alloc]init];
    [dic setValue:@"ZhangSan" forKey:@"name"];
    [dic setValue:[NSNumber numberWithInt:10] forKey:@"age"];
    [dic setValue:[NSNumber numberWithBool:YES] forKey:@"sex"];
    
    [person setValuesForKeysWithDictionary:dic];
    
    NSLog(@"The person's name is :%@,and age is :%d, sex is :%d",
          [person valueForKey:@"name"],
          [[person valueForKey:@"age"] intValue],
          [[person valueForKey:@"sex"] boolValue]
          );

    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
