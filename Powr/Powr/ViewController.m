//
//  ViewController.m
//  Powr
//
//  Created by 北京时代华擎 on 2017/9/3.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{

    NSArray *dataSource;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSource];
    [self initUITableView];
}

-(void)initDataSource{


    dataSource = @[@"json",@"xml",@"login",@"URLSession",@"URLConnection",@"https信任",@"upload",@"xmlBase",@"plistBase",@"arch",@"RunLoop",@"Runtimer",@"KVO",@"BottomNavagation",@"pageView"];
}

-(void)initUITableView{
    
    UITableView *table =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    table.delegate  =self;
    table.dataSource=self;
    table.backgroundColor = [UIColor  whiteColor];
    [self.view addSubview:table];
    


}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *identifier = @"idntifier";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text=dataSource[indexPath.row];
    

    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return dataSource.count;
}

#pragma mark - UITabelViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 40;

}






- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//     jsonViewController* xm = [[jsonViewController alloc]init];
//    [self.navigationController pushViewController:xm animated:nil];
    if (indexPath.row==0) {
        xmlViewController *xml = [[xmlViewController alloc]init];
        [self.navigationController pushViewController:xml animated:nil];
    
    }else if (indexPath.row==2){
    
        loginViewController *xml = [[loginViewController alloc]init];
        [self.navigationController pushViewController:xml animated:nil];
        

    
    }else if (indexPath.row==3){
        
        URLSessionViewController *xml = [[URLSessionViewController alloc]init];
        [self.navigationController pushViewController:xml animated:nil];
        
        
        
    }else if (indexPath.row==4){
        
        ConnectionViewController *xml = [[ConnectionViewController alloc]init];
        [self.navigationController pushViewController:xml animated:nil];
        
        
        
       }else if (indexPath.row==5){
        
        HttpsViewController *xml = [[HttpsViewController alloc]init];
        [self.navigationController pushViewController:xml animated:nil];
        
        
        
       }else if (indexPath.row==6){
           
           uploadViewController *xml = [[uploadViewController alloc]init];
           [self.navigationController pushViewController:xml animated:nil];
           
           
           
       }else if (indexPath.row==7){
           
           XmlBaseViewController *xml = [[XmlBaseViewController alloc]init];
           [self.navigationController pushViewController:xml animated:nil];
           
       }else if (indexPath.row==8){
           
           plistBaseViewController *xml = [[plistBaseViewController alloc]init];
           [self.navigationController pushViewController:xml animated:nil];
           
           
           
       }else if (indexPath.row==9){
           
           arichViewController *xml = [[arichViewController alloc]init];
           [self.navigationController pushViewController:xml animated:nil];
           
           
           
       }else if (indexPath.row==10){
           
          NSRunLoopViewController  *xml = [[NSRunLoopViewController alloc]init];
           [self.navigationController pushViewController:xml animated:nil];
           
           
           
       }else if (indexPath.row==11){
           
           RuntimerViewController  *xml = [[RuntimerViewController alloc]init];
           [self.navigationController pushViewController:xml animated:nil];
           
           
           
       }else if (indexPath.row==12){
           
           KVOViewController  *xml = [[KVOViewController alloc]init];
           [self.navigationController pushViewController:xml animated:nil];
           
           
           
       }else if (indexPath.row==13){
           
           BottomViewController  *xml = [[BottomViewController alloc]init];
           [self.navigationController pushViewController:xml animated:nil];
           
           
           
       }else if (indexPath.row==14){
           
           PageViewController  *xml = [[PageViewController alloc]init];
           [self.navigationController pushViewController:xml animated:nil];
           
           
           
       }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
