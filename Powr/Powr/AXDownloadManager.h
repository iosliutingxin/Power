//
//  AXDownloadManager.h
//  Powr
//
//  Created by 北京时代华擎 on 2017/10/29.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
//管理所有的下载任务---单利
@interface AXDownloadManager : NSObject

+(instancetype)shareDownloadManager;
-(void)downloadWithURL:(NSURL *)url progress:(void(^)(float progress))progress
            completion:(void(^)(NSString *filePath))completion
                failed:(void(^)(NSString * error))failed;
@end
