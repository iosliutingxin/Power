//
//  NSRunLoopViewController.m
//  Powr
//
//  Created by guo on 2017/12/9.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "NSRunLoopViewController.h"

@interface NSRunLoopViewController ()
@property(nonatomic,assign)BOOL finished;
@end

@implementation NSRunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addRunLoopOberver];
}


#pragma mark---<关于runloop的第一种测试>解决一次同时加载很多高清大图卡顿现象

-(void)addRunLoopOberver{
    
//    1.拿到当前的runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    
//    2.创建观察者、
//    2.1定义
    static CFRunLoopObserverRef myRunloopOberver;
//    2.2创建
    myRunloopOberver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, 0 , &CallBack, NULL);
    
//    3.添加观察者
    CFRunLoopAddObserver(runloop, myRunloopOberver, kCFRunLoopCommonModes);
    

}

static void CallBack(){
    
    NSLog(@"come here");
    
    
}




#pragma mark---<关于runloop的第一种测试>
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  
    _finished =YES;
}

-(void)runloop01{
    
    
    _finished =NO;
    NSThread *thread = [[NSThread alloc]initWithBlock:^{
        NSTimer *timer = [NSTimer timerWithTimeInterval:0 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
        //开启这条线程上的runloop保证线程不退出
        [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
        
        
        while (!_finished) {
            [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.00001]];
        }
        
    }];
    
    [thread start];
}


-(void)timerMethod{
    
    NSLog(@"come here");
    [NSThread sleepForTimeInterval:1.0];
    
    static int num = 0;
    NSLog(@"%@ ---%d",[NSThread currentThread],num++);
}


@end
