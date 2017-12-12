//
//  BlockViewController.m
//  Powr
//
//  Created by guo on 2017/12/12.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()
//注意
//简单的理解block代码块的作用就和C语言的函数的作用类似，就是将能够实现某种特定功能的一些代码包裹起来，留出必要的接口（就是参数），供外界调用。
@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//使用block对数组进行排序
-(void)demo1{
    
    NSArray * array=[NSArray arrayWithObjects:@"4",@"1",@"2",@"3",@"5", nil];
    array= [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        int a1=[obj1 intValue];
        int a2=[obj2 intValue];
        return a1>=a2?-1:1;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
