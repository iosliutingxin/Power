//
//  XmlBaseViewController.m
//  Powr
//
//  Created by guo on 2017/12/3.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "XmlBaseViewController.h"

@interface XmlBaseViewController ()

@end

@implementation XmlBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

//    获取沙盒路径
    NSString *homePath = NSHomeDirectory();
//    拼接方法01
    NSString *document = [homePath stringByAppendingString:@"/Documents"];
    
//    拼接方法02
    NSString *document01 = [homePath stringByAppendingPathComponent:@"Documents"];
    
//    直接获取03(利用系统提供搜索文件夹的方法)
    NSString *document02 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSLog(@"%@",document02);

}



@end
