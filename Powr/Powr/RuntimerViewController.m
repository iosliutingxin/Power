//
//  RuntimerViewController.m
//  Powr
//
//  Created by guo on 2017/12/11.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "RuntimerViewController.h"
#import "NSURL+AXUrl.h"
@interface RuntimerViewController ()

@end

@implementation RuntimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSURL * url = [NSURL URLWithString:@"https://www.baidu.com/s?wd=%E8%B5%B7%E7%82%B9%E4%B8%AD%E6%96%87%E7%BD%91&rsv_spt=1&rsv_iqid=0x90d87fb700003a2a&issp=1&f=3&rsv_bp=1&rsv_idx=2&ie=utf-8&rqlang=cn&tn=baiduhome_pg&rsv_enter=1&oq=%25E7%2599%25BE%25E5%25BA%25A6%25E7%25BF%25BB%25E8%25AF%2591&rsv_t=c65eZbjPDSxQPSk8rcDQraSf9q%2FdaqwYJ8kMXJ%2Fz5dcNe5MpbFIENvG97j1NpOouJyez&inputT=5353&rsv_sug3=20&rsv_sug1=31&rsv_sug7=101&rsv_pq=fceba89800003312&rsv_sug2=1&prefixsug=%25E8%25B5%25B7%25E7%2582%25B9&rsp=1&rsv_sug4=6343&rsv_sug=2"];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];

//    NSURLResponse *response=nil;
//    //请求返回NSData类型数据
//    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
//    //简析数据
//    id result=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
//    NSLog(@"%@",result);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
