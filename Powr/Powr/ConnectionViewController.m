//
//  ConnectionViewController.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/10/26.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "ConnectionViewController.h"
#import "AXDownloadManager.h"

@interface ConnectionViewController ()

@property(strong,nonatomic)NSURL *url;
@end

@implementation ConnectionViewController

- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor whiteColor];
    [super viewDidLoad];
    [self createView];
}
/**
同步方法的应用场景
1.抓去网络数据
2.加载本地数据
3.加载要下载文件的头部信息
*/
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    AnDownloader *download=[[AnDownloader alloc]init];
//    NSURL *url=[NSURL URLWithString:@"http://117.41.172.5:81/epson/epsonbook/cb-1460ui-7.mp4"];
//    [download downloadWithURL:url progress:^(float progress) {
//        NSLog(@"--progressblack--%f  线程 %@",progress,[NSThread currentThread]);
//    } completion:^(NSString *filePath) {
//        NSLog(@"--sucessBlock--%@ 线程==%@",filePath,[NSThread currentThread]);
//    } failed:^(NSString *error) {
//        NSLog(@"---failedBlock--%@",error);
//    }];
//    
//    
//    
//}

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

- (void)createView{
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake(self.view.frame.size.width/2-50, 100, 100, 40);
    btn1.backgroundColor=[UIColor redColor];
    btn1.tag =10;
    [btn1 setTitle:@"开始" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(startValue:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn1];
    
    UIButton *stop=[UIButton buttonWithType:UIButtonTypeCustom];
    stop.frame=CGRectMake(self.view.frame.size.width/2-50, 150, 100, 40);
    stop.backgroundColor=[UIColor redColor];
    stop.tag =10;
    [stop setTitle:@"暂停" forState:UIControlStateNormal];
    [stop addTarget:self action:@selector(StopValue:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:stop];
    
    
    UIButton *continu=[UIButton buttonWithType:UIButtonTypeCustom];
    continu.frame=CGRectMake(self.view.frame.size.width/2-50, 200, 100, 40);
    continu.backgroundColor=[UIColor redColor];
    continu.tag =10;
    [continu setTitle:@"继续" forState:UIControlStateNormal];
    [continu addTarget:self action:@selector(continueValue:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:continu];
    
    
    
}


// 开始
-(void)startValue:(UIButton *)object{
    
    NSLog(@"begin");
    
    self.url=[NSURL URLWithString:@"http://117.41.172.5:81/epson/epsonbook/cb-1460ui-7.mp4"];
    [[AXDownloadManager shareDownloadManager] downloadWithURL:self.url progress:^(float progress) {
        NSLog(@"--progressblack--%f  线程 %@",progress,[NSThread currentThread]);
    } completion:^(NSString *filePath) {
        NSLog(@"--sucessBlock--%@ 线程==%@",filePath,[NSThread currentThread]);
    } failed:^(NSString *error) {
        NSLog(@"---failedBlock--%@",error);
    }];
    

}

//暂停
-(void)StopValue:(UIButton *)object{
    
    NSLog(@"pase");
//    [self.downloader pause];
    [[AXDownloadManager shareDownloadManager] pauserWithUrl:self.url];
    

    
}

//继续
-(void)continueValue:(UIButton *)object{
    
    NSLog(@"continue");
    
}


@end
