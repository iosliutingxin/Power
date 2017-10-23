//
//  URLSessionViewController.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/10/11.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "URLSessionViewController.h"

@interface URLSessionViewController ()<NSURLSessionDownloadDelegate>
@property(nonatomic,strong)NSURLSession *session;
//全局的下载队列
@property(nonatomic,strong)NSURLSessionDownloadTask *downlodTase;
@property(nonatomic,strong)NSData * resumData;
@end

@implementation URLSessionViewController

-(NSURLSession *)session{
    
    if (_session==nil) {
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
        
    }
    
    return _session;

}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self createView];

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
    
//1， 任务放到异步中执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"把下载任务放到异步去执行");
        
        NSURL *url=[NSURL URLWithString:@"http://117.41.172.5:81/epson/epsonbook/cb-1460ui-7.mp4"];
        //    [[self.session downloadTaskWithURL:url] resume];
        self.downlodTase= [self.session downloadTaskWithURL:url];
        [self.downlodTase resume];
        
        NSLog(@"start");

    });
    
//2，任务在主线程中执行
//    NSURL *url=[NSURL URLWithString:@"http://117.41.172.5:81/epson/epsonbook/cb-1460ui-7.mp4"];
//    //    [[self.session downloadTaskWithURL:url] resume];
//    self.downlodTase= [self.session downloadTaskWithURL:url];
//    [self.downlodTase resume];
//    
//    NSLog(@"start");
}

//暂停
-(void)StopValue:(UIButton *)object{

    NSLog(@"stop");
//resumeData续传数据（下载了多少）
    [self.downlodTase cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        NSLog(@"数据的长度：%tu",resumeData.length);
//释放下载数据（释放掉任务）
        
        self.downlodTase=nil;
        self.resumData=resumeData;
    }];

}

//继续
-(void)continueValue:(UIButton *)object{
    if (self.resumData==nil) {
        
        NSLog(@"没有缓存的数据");
        return;
    }

    NSLog(@"continue");
//使用续传数据启动下载任务(重新开启一个任务)
    self.downlodTase=[self.session downloadTaskWithResumeData:self.resumData];
//清空缓存的数据
    self.resumData=nil;
//所有任务都是默认挂起的
    [self.downlodTase resume];
    
 

}


//使用NSURLSeseion进行下载
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSURL *url=[NSURL URLWithString:@"http://117.41.172.5:81/epson/epsonbook/cb-1460ui-7.mp4"];
    
//1、全局的session
//    [[[NSURLSession sharedSession]downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        NSLog(@"%@",location);
//    }]resume];
    
//2、自己定义的session
//如果要跟进下载进度，不能使用block回调的方式
    [[self.session downloadTaskWithURL:url] resume];
    
    
}

#pragma mark NSURLSessionDownloadDelegate

//1.下载完成
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSLog(@"sucess==%@",location);

}

//2.下载进度
/**
 1.session
 2.downloadTask               调用代理方式的下载任务
 3.bytesWritten               本次下载的字节数
 4.totalBytesWritten          已经下载的字节数
 5.totalBytesExpectedToWrite  期望下载的我子节数---文件大小
 
 */

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    
    
    float progress =(float)totalBytesWritten / totalBytesExpectedToWrite;
    NSLog(@"%f",progress);
}

//3、下载续传数据
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{

}



@end
