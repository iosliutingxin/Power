//
//  AnDownloader.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/10/26.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "AnDownloader.h"

#define KTimeout 20.0

//类扩展
@interface AnDownloader ()<NSURLConnectionDataDelegate>
//文件总大小
@property(assign,nonatomic)long long expectedContentLength;
//文件路程
@property(copy,nonatomic)NSString *filePath;
//本地文件大小
@property(assign,nonatomic)long long currentLenght;
//保存下载链接
@property(nonatomic,strong)NSURL *downloadURL;
//文件输出流
@property(nonatomic,strong)NSOutputStream *fileStream;
//下载任务的Runloop
@property(assign,nonatomic)CFRunLoopRef downloadRunloop;
@end

@implementation AnDownloader

-(void)downloadWithURL:(NSURL *)url{
//0.保存URL
    self.downloadURL =url;
    
//1.看服务器上文件大小
    [self serverFileInfoWithURL:url];
    NSLog(@"%lld %@",self.expectedContentLength,self.filePath);
//2.看本地是否有文件
    if (![self checkLocalFileInfo]) {
        NSLog(@"下载完毕");
        return;
    }
//3.开始从服务器下载数据
    NSLog(@"开始下载文件");
    [self downloadFile];
    
    

}
#pragma mark --下载文件
//开始下载文件
-(void)downloadFile{
    
    
//把下载任务放到子线程中执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
  
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.downloadURL cachePolicy:1 timeoutInterval:KTimeout];
    
//    设置下载的位置，从self.currentLenght后面的字节开始下载
    NSString *rangeStr = [NSString stringWithFormat:@"bytes=%lld-",self.currentLenght];
//    设置请求头字段
    [request setValue:rangeStr forHTTPHeaderField:@"Range"];
    
// 1.开始网络连接
    NSURLConnection * conn=[NSURLConnection connectionWithRequest:request delegate:self];
    
//    2.启动网络连接
    [conn start];
        
//3.开启运行循环
        self.downloadRunloop = CFRunLoopGetCurrent();
        CFRunLoopRun();
        
    });

}


#pragma mark --私有方法
//检查本地文件信息
-(BOOL)checkLocalFileInfo{
    
    long long fileSize=0;

//    判断文件是否存在
    if ([[NSFileManager defaultManager]fileExistsAtPath:self.filePath]) {
//        获取文件大小
       NSDictionary *attributes = [[NSFileManager defaultManager]attributesOfItemAtPath:self.filePath error:NULL];
//        利用分类方法获取文件大小
        fileSize = [attributes fileSize];
        self.currentLenght =fileSize;
        

    }
    
    
//    本地文件和网络文件开始比较
    //（1）有个没有文件开始下载
    //（2）如果文件大小小于服务器文件的大小，开始续传
    //（3）如果等于则下载完成
    //（4）如果大于则删除本地文件，重新下载
//    如果大于网络文件
    if (fileSize>self.expectedContentLength) {
        //删除本地文件
        [[NSFileManager defaultManager]removeItemAtPath:self.filePath error:NULL];
        fileSize=0;
    }
//    如果等于网络文件
    self.currentLenght =fileSize;
    if (fileSize==self.expectedContentLength) {
        
        return NO;
    }
  
    return YES;
}

//检查服务器文件大小
-(void)serverFileInfoWithURL:(NSURL *)url{

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:1 timeoutInterval:KTimeout];
    request.HTTPMethod=@"HEAD";
    
    
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    
//3.纪录文件信息
//（1）文件长度
    self.expectedContentLength=response.expectedContentLength;
//(2)建议保存文件名，将文件保存在tmp中，系统会自动回收
    self.filePath=[NSTemporaryDirectory() stringByAppendingPathComponent:response.suggestedFilename];
    return;
}

#pragma mark --<NSURLConnectionDataDelegate>
//1.接收服务器响应
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    self.fileStream=[[NSOutputStream alloc]initToFileAtPath:self.filePath append:YES];
    [self.fileStream open];
    
    

}

//2.接收到数据用输出流拼接，计算下载进度
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
//    追加数据
    [self.fileStream write:data.bytes maxLength:data.length];
//    纪录文件长度
    self.currentLenght +=data.length;
    
    float progress = (float)self.currentLenght / self.expectedContentLength;
    
    NSLog(@"进度===%f %@",progress,[NSThread currentThread]);

}

//3.所有任务下载完毕
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    [self.fileStream close];
//   停止运行循环
    CFRunLoopStop(self.downloadRunloop);

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    [self.fileStream close];
    NSLog(@"error === %@",error.debugDescription);
    //   停止运行循环
    CFRunLoopStop(self.downloadRunloop);

}



@end
