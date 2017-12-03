//
//  plistBaseViewController.m
//  Powr
//
//  Created by guo on 2017/12/3.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "plistBaseViewController.h"

@interface plistBaseViewController ()

@end

@implementation plistBaseViewController

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
    
//    获取沙盒路径(写入路径时要知道文件名称和扩展名)
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:@"XanB.plist"];
    
//    存储数组
    NSArray *arr =@[@"20",@"婚庆",@"生活"];
    
//    存储字典
    NSDictionary * dic = @{@"Key":@"value"};
    [dic writeToFile:filePath atomically:YES];
    
    
//    偏好设置(苹果封装好的，不需要关心文件名)
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"XanL" forKey:@"key"];
    
//    同步(在iOS8以前，偏好设置并不是立马保存，要调用同步方法)
    [defaults synchronize];
    
    
    [defaults objectForKey:@"key"];
   
    
}

//取出
-(void)StopValue:(UIButton *)object{
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:@"XanB.plist"];
    

//    NSArray * arr = [NSArray arrayWithContentsOfFile:filePath];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"%@",dic);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
