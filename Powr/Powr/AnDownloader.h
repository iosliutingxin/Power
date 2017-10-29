//
//  AnDownloader.h
//  Powr
//
//  Created by 北京时代华擎 on 2017/10/26.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
//下载类
@interface AnDownloader : NSObject
//对外提供的接口
/*
 扩展
 1.进度      --通知下载百分比
 2.是否完成  --通知下载保存路径
 3.是否出错  --通知错误信息
 
 代理／Block
 
 **/
-(void)downloadWithURL:(NSURL *)url progress:(void(^)(float progress))progress
            completion:(void(^)(NSString *filePath))completion
                 failed:(void(^)(NSString * error))failed;

//暂停方法
-(void)pause;

@end
