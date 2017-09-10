//
//  jsonViewController.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/9/9.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "jsonViewController.h"

@interface jsonViewController ()

@end

@implementation jsonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self serializationJSon];
}

-(void)serializationJSon{
    
    NSURL *url = [NSURL URLWithString:@"http://123.56.134.198:8082/api.php?app=brand"];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    //3,建立网路连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"%@",data);
        //将二进制转化为字符串
        id result =[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSLog(@"==>%@",result);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
