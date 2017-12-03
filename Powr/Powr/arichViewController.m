//
//  arichViewController.m
//  Powr
//
//  Created by guo on 2017/12/3.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "arichViewController.h"
#import "Teacher.h"

@interface arichViewController ()

@end

@implementation arichViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self createView];
}

- (void)createView{
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake(self.view.frame.size.width/2-50, 100, 100, 40);
    btn1.backgroundColor=[UIColor redColor];
    btn1.tag =10;
    [btn1 setTitle:@"存储" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(startValue:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn1];
    
    UIButton *stop=[UIButton buttonWithType:UIButtonTypeCustom];
    stop.frame=CGRectMake(self.view.frame.size.width/2-50, 150, 100, 40);
    stop.backgroundColor=[UIColor redColor];
    stop.tag =10;
    [stop setTitle:@"取出" forState:UIControlStateNormal];
    [stop addTarget:self action:@selector(StopValue:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:stop];
    
    
    
    
    
}


//存储
-(void)startValue:(UIButton *)object{
    
    Teacher *teacher = [[Teacher alloc]init];
    teacher.name =@"names";
    teacher.age = 19;
    
//    获取路径
    NSString *temp = NSTemporaryDirectory();
    NSString *file =[temp stringByAppendingPathComponent:@"XanB.data"];
    
    NSLog(@"%@",temp);
    
//    归档
    [NSKeyedArchiver archiveRootObject:teacher toFile:file];
    
    
}

//取出
-(void)StopValue:(UIButton *)object{
    
    //    获取路径
    NSString *temp = NSTemporaryDirectory();
    NSString *file =[temp stringByAppendingPathComponent:@"XanB.data"];
    
    
    Teacher *teacher = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    NSLog(@"%@",teacher.name);
 
}


@end
