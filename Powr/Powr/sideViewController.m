//
//  sideViewController.m
//  网易新闻
//
//  Created by 李孔文 on 2018/4/26.
//  Copyright © 2018年 winter. All rights reserved.
//

#import "sideViewController.h"
#import "WDLeftView.h"
#define screenwidth ([UIScreen mainScreen].bounds.size.width)
#define screenheight ([UIScreen mainScreen].bounds.size.height)
@interface sideViewController ()<WDLeftViewDelegate>
@property(nonatomic,strong)WDLeftView *left;
@end

@implementation sideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    // 单击的 Recognizer
    UITapGestureRecognizer *single = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SingleTap:)];
    //点击的次数
    single.numberOfTapsRequired = 1; // 单击
    //给self.view添加一个手势监测；
    [self.view addGestureRecognizer:single];

}

-(void)inputSidebarView{
    
    if (!_left) {
        
        _left = [[WDLeftView alloc] init];
        
    }
    _left.delegate = self;
    //设置左侧菜单
    CGFloat leftW = 0.7 * screenwidth;
    _left.userInteractionEnabled = YES;
    _left.frame = CGRectMake(-leftW , 0, leftW, screenheight);
    [self.view addSubview:_left];
    _left.backgroundColor = [UIColor colorWithRed:153/255 green:153/255 blue:153/255 alpha:1];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        _left.transform = CGAffineTransformTranslate(_left.transform, screenwidth *0.7, 0);
//        self.parentViewController.view.transform = CGAffineTransformTranslate(self.parentViewController.view.transform, screenwidth *0.7, 0);
        
    }];
    
}

-(void)SingleTap:(UITapGestureRecognizer *)tap{
    NSLog(@"点击了");
    [UIView animateWithDuration:0.5 animations:^{
        _left.transform = CGAffineTransformIdentity;
//        self.parentViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self  removeFromParentViewController];
    }];
}

#pragma WDLeftViewDelegate
- (void)leftBtnDidClicked:(int)tag{
    NSLog(@"点击了==%d",tag);
}


@end
