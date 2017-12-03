//
//  Teacher.m
//  Powr
//
//  Created by guo on 2017/12/3.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

//告诉系统要归档哪些属性
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeInt:_age forKey:@"age"];
}


//告诉系统要解档哪些数据
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        
        _name = [coder decodeObjectForKey:@"name"];
        _age = [coder decodeIntForKey:@"age"];
    }
    return self;
}
@end
