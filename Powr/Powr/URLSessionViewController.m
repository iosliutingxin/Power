//
//  URLSessionViewController.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/10/11.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "URLSessionViewController.h"

@interface URLSessionViewController ()

@end

@implementation URLSessionViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];

}


//使用NSURLSeseion进行下载
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSURL *url=[NSURL URLWithString:@"http://117.41.172.5:81/epson/epsonbook/cb-1460ui-7.mp4"];
    
    [[[NSURLSession sharedSession]downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@",location);
    }]resume];
}



@end
