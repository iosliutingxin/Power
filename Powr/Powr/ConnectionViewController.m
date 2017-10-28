//
//  ConnectionViewController.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/10/26.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "ConnectionViewController.h"
#import "AnDownloader.h"
@interface ConnectionViewController ()

@end

@implementation ConnectionViewController

- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor whiteColor];
    [super viewDidLoad];
}
/**
同步方法的应用场景
1.抓去网络数据
2.加载本地数据
3.加载要下载文件的头部信息
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    AnDownloader *download=[[AnDownloader alloc]init];
    NSURL *url=[NSURL URLWithString:@"http://117.41.172.5:81/epson/epsonbook/cb-1460ui-7.mp4"];
    [download downloadWithURL:url progress:^(float progress) {
        NSLog(@"--progressblack--%f  线程 %@",progress,[NSThread currentThread]);
    } completion:^(NSString *filePath) {
        NSLog(@"--sucessBlock--%@ 线程==%@",filePath,[NSThread currentThread]);
    } failed:^(NSString *error) {
        NSLog(@"---failedBlock--%@",error);
    }];
    
    
    
}

-(void)dome1{

    
    NSURL *url=[NSURL URLWithString:@"http://117.41.172.5:81/epson/epsonbook/cb-1460ui-7.mp4"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    NSURLResponse *response=nil;
    //请求返回NSData类型数据
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    //简析数据
    id result=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSLog(@"%@",result);

}


@end
