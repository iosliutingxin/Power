//
//  KVOViewController.m
//  Powr
//
//  Created by guo on 2017/12/12.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "KVOViewController.h"
#import "Persons.h"
@interface KVOViewController ()
@property(nonatomic,strong)Persons *per;
/**
 (全称：Key-Value-Observer，键值观察(或键值监听))
 在编程过程中，有时需要对对象的某个或某些属性进行监听，通过对象属性的变化采取相应的对策。
 */
@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   _per = [[Persons alloc]init];
    [_per setValue:@"Jim" forKey:@"name"];
    [_per setValue:[NSNumber numberWithInt:20] forKey:@"age"];
    
    [_per addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];



}

//观察对象改变后调用方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"%@",change);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    [_per setValue:@"Jims" forKey:@"name"];

    // Dispose of any resources that can be recreated.
}




@end
