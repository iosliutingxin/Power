//
//  PageViewController.m
//  Powr
//
//  Created by guo on 2017/12/24.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "PageViewController.h"
#import "pageView.h"
@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    pageView *pagView = [pageView pageView];
    pagView.frame = CGRectMake(0, 60, self.view.bounds.size.width, 200);
    pagView.imageNames = @[@"004",@"002",@"003"];
    pagView.currentColor = [UIColor redColor];
    pagView.otherColor = [UIColor blackColor];
    [self.view addSubview:pagView];
}



@end
