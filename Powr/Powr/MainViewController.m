//
//  MainViewController.m
//  网易新闻
//
//  Created by 李孔文 on 2018/4/26.
//  Copyright © 2018年 winter. All rights reserved.
//

#import "MainViewController.h"
#import "sideViewController.h"
@interface MainViewController ()

@property(nonatomic,strong)sideViewController *vc;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)createSidebar:(id)sender {
    
    [self createChilder];

}

- (void)createChilder {
  
    if (!_vc) {
        
        self.vc = [[sideViewController alloc] init];
        
    }
    [self addChildViewController:self.vc];
    [self.view addSubview:self.vc.view];
     self.vc.view.frame = self.view.bounds;
    [self.vc inputSidebarView];
   
}


@end
