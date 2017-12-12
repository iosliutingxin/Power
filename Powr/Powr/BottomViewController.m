//
//  BottomViewController.m
//  Powr
//
//  Created by guo on 2017/12/12.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "BottomViewController.h"

@interface BottomViewController ()
@property(nonatomic,strong)BottomViewController *bottom;

@end

@implementation BottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBottomController];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createBottomController{
    
    UIViewController *vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    vc1.tabBarItem.title = @"控制器1";
    vc1.tabBarItem.badgeValue=@"11";
    
    
    UIViewController *vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor = [UIColor redColor];
    vc2.tabBarItem.title = @"控制器2";

    
    
    UIViewController *vc3 = [[UIViewController alloc]init];
    vc3.view.backgroundColor = [UIColor yellowColor];
    vc3.tabBarItem.title = @"控制器3";


    self.viewControllers =@[vc3,vc2,vc1];
}
@end
