//
//  NSRunLoopViewController.m
//  Powr
//
//  Created by guo on 2017/12/9.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "NSRunLoopViewController.h"

typedef void (^RunloopBlock)(void);

@interface NSRunLoopViewController ()

@property(nonatomic,assign)BOOL finished;
@property(nonatomic,strong)NSMutableArray *tasks;
@property(nonatomic,assign)NSInteger maxQueueLenght;
@end

@implementation NSRunLoopViewController

- (void)viewDidLoad {
    _maxQueueLenght =18;
    _tasks = [NSMutableArray array];
    
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self runloop02];
    [self addRunLoopOberver];
}


#pragma mark---<关于runloop的第一种测试>解决一次同时加载很多高清大图卡顿现象

-(void)addRunLoopOberver{
    
//    1.拿到当前的runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    
//    2.创建观察者、
//    定义一个content
    CFRunLoopObserverContext content = {
        
        0,
        (__bridge void *)self,
        &CFRetain,
        &CFRelease,
        NULL
    };
//    2.1定义
    static CFRunLoopObserverRef myRunloopOberver;
//    2.2创建
    myRunloopOberver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, 0 , &CallBack, &content);
    
//    3.添加观察者
    CFRunLoopAddObserver(runloop, myRunloopOberver, kCFRunLoopCommonModes);
    
    
//    注意c语言里面有create就需要释放
    CFRelease(myRunloopOberver);
    
  
}

//、回掉
static void CallBack(CFRunLoopObserverRef observer,CFRunLoopActivity activity, void * info){
    
//  从数组中取出任务执行
    NSRunLoopViewController  *vc = (__bridge UIViewController*)info;
    if (vc.tasks.count == 0) {
        return;
    }
//    拿出第一个任务
    RunloopBlock task = vc.tasks.firstObject;
    
//    执行
    task();
//    干掉第一个
    [vc.tasks removeObjectAtIndex:0];
    
}

//添加新任务
-(void)addTasks:(RunloopBlock)task{
    
    [self.tasks addObject:task];
    if (self.tasks.count > _maxQueueLenght) {
        [self.tasks removeObjectAtIndex:0];
    }
}

-(void)runloop02{
    
    [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];

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
//
//    NSLog(@"come here");
//    [NSThread sleepForTimeInterval:1.0];
//
//    static int num = 0;
//    NSLog(@"%@ ---%d",[NSThread currentThread],num++);
}


@end
