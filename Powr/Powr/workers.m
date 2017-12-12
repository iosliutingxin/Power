//
//  workers.m
//  Powr
//
//  Created by guo on 2017/12/12.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "workers.h"

@implementation workers
-(instancetype)init{
    
    if(self = [super init]){
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(makeCar) name:@"makeCar" object:nil];
    }
    
    return self;
}

-(void)makeCar{
    
    NSLog(@"制作汽车");
}
@end
