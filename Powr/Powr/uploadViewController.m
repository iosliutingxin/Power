//
//  uploadViewController.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/11/5.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "uploadViewController.h"

@interface uploadViewController ()

@end

@implementation uploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark --上传演练
-(void)putUpload{

    //1.保存在服务器上的文件名
    NSURL *url = [NSURL URLWithString:@"http://192.168.31.180/uploads/123.png"];
    
    
    //2.请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
    //3.设置请求方法，webdav需要put方法
    request.HTTPMethod = @"PUT";
    //设置身份验证信息
    NSString *authStr = [self base64Encode:@"admin:123456"];
    authStr = [@"BASIC " stringByAppendingString:authStr];
    
    //设置请求头信息
    [request setValue:authStr forHTTPHeaderField:@"Authorization"];
    
    
    //4.session(上传源文件的路径)
    NSURL *fileUrl = [[NSBundle mainBundle]URLForResource:@"info.plist" withExtension:nil];
    
    
    [[[NSURLSession sharedSession]uploadTaskWithRequest:request fromFile:fileUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@ %@",str,response);
    }] resume];
    
    
}

/**
 WebDav 的用户名密码格式
 格式：basic（用户名：密码）base64编码
  admin：123
 */

-(NSString *)base64Encode:(NSString *)str{

//1，转为二进制
    NSData *date = [str dataUsingEncoding:NSUTF8StringEncoding];
    
//2.base64编码
    return [date base64EncodedStringWithOptions:0];
    
}

@end
