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
-(void)downloadWithURL:(NSURL *)url;

@end
