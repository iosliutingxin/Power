//
//  HttpsViewController.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/10/31.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "HttpsViewController.h"

@interface HttpsViewController ()<NSURLSessionTaskDelegate>

@end

@implementation HttpsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

//1,公司Https已经认证过，直接可以拿到数据
-(void)httpsOne{
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);

    }];
    [task resume];

}

//2. 没有经过认证的证书
-(void)httpsTwo{
    
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);

    }];
    
    [task resume];

}

#pragma mark ---<协议>
-(void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
{
    
//1.判断服务器的身份认证的方法是否是信任服务器证书
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        NSLog(@"是信任证书");
        
//        2.获得证书
        NSURLCredential * credentail = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//        3.处理服务器证书
        completionHandler(NSURLSessionAuthChallengeUseCredential,credentail);
    }
    
    
    


}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self httpsTwo];
}


@end
