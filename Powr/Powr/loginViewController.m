//
//  loginViewController.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/10/6.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}

-(void)createView{
    
    //账号
    self->username = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 50)];
    self->username.backgroundColor=[UIColor whiteColor];
    self->username.placeholder=@"账户";
    [self.view addSubview:self->username];
    
    //密码
    self->password = [[UITextField alloc]initWithFrame:CGRectMake(10, 160, self.view.frame.size.width-20, 50)];
    self->password.backgroundColor=[UIColor whiteColor];
    self->password.placeholder=@"密码";
    [self.view addSubview:self->password];
    
    //登陆按钮
    UIButton *login =[[UIButton alloc]initWithFrame:CGRectMake(10, 220, self.view.frame.size.width-20, 50)];
    login.backgroundColor=[UIColor whiteColor];
    [login setTitle:@"login" forState:UIControlStateNormal];
    [login setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [login addTarget:self action:@selector(loginFocusWithUserName:passWord:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:login];
    


}
-(void)loginFocusWithUserName:(NSString *)username passWord:(NSString *)password{
    
    NSString *name = self->username.text;
    NSString *pwd  = self->password.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
