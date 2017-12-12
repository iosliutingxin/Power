//
//  NotificationViewController.m
//  Powr
//
//  Created by guo on 2017/12/12.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "NotificationViewController.h"
#import "workers.h"
@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    workers *work= [[workers alloc]init];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"makeCar" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:work name:@"makeCar" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
