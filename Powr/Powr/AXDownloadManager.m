//
//  AXDownloadManager.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/10/29.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "AXDownloadManager.h"
#import "AnDownloader.h"

@interface AXDownloadManager ()

//下载缓冲池
@property(strong,nonatomic)NSMutableDictionary *downloadCache;
//下载错误
@property(copy,nonatomic)void(^failBlock)(NSString *);
@end

@implementation AXDownloadManager

-(NSMutableDictionary *)downloadCache{


    if (!_downloadCache) {
        
        _downloadCache = [NSMutableDictionary dictionary];
    }
    
    return _downloadCache;
}

/*
 每次实例化一个AnDownloader对应一个文件的下载操作
 如果操作没有完毕不需要在次开启
 用一个缓冲池保存下载对象
 **/

+(instancetype)shareDownloadManager{

    static id instance;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc]init];
    });
    
    return  instance;
}

//下载
-(void)downloadWithURL:(NSURL *)url progress:(void(^)(float progress))progress
            completion:(void(^)(NSString *filePath))completion
                failed:(void(^)(NSString * error))failed{
//0,纪录下载失败的回调
    self.failBlock=failed;
    
//1,判断缓冲池是否存在下载任务
      AnDownloader *downloader =self.downloadCache[url.path];     if (downloader !=nil) {
        NSLog(@"任务已经存在!!!");
        return;
    }
//2.创建新的下载任务
   downloader = [[AnDownloader alloc]init];
//3.保存下载任务
    [self.downloadCache setObject:downloader forKey:url.path];
//传递block
//4.下载完成清除任务
    [downloader downloadWithURL:url progress:progress completion:^(NSString *filePath) {
        //        1,从下载缓冲池中删除下载任务
        [self.downloadCache removeObjectForKey:url.path];
        //        2,执行调用方的block
        if (completion) {
            completion(filePath);
        }

    } failed:^(NSString *error) {
        //        1,从下载缓冲池中删除下载任务
        [self.downloadCache removeObjectForKey:url.path];
        //        2,执行调用方的block
        if (failed) {
            failed(error);
        }
        

    }];

}

//暂停
-(void)pauserWithUrl:(NSURL *)url{
    
//0.判断操作释放存在
    
//1.找出下载路径
    AnDownloader *downloader =self.downloadCache[url.path];
    
    if (downloader == nil) {
        if (self.failBlock) {
            
            self.failBlock(@"操作不存在");
        }
        
        return;
    }
    
//2.暂停下载
    [downloader pause];
    
//3.删除下载路径
    [self.downloadCache removeObjectForKey:url.path];

    
    


}


@end
