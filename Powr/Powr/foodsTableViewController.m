//
//  foodsTableViewController.m
//  Powr
//
//  Created by guo on 2018/1/2.
//  Copyright © 2018年 iOS _Liu. All rights reserved.
//

#import "foodsTableViewController.h"
#import "AXFoodInfo.h"
#import "foodsCell.h"
@interface foodsTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation foodsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册cell方便从缓存池中取出
    //1,加载XIB的时候不能用类名来注册
    //[self.tableView registerClass:[foodsCell class] forCellReuseIdentifier:@"cell"];
    
    //2.通过XIB加载view
    //UIView *view = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([foodsCell class]) owner:nil options:nil]lastObject];
    
    
    //3.通过XIB注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AXFoodInfo class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    //加载自定义cell
    foodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //如果没有注册的时候做一次判断
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([foodsCell class]) owner:nil options:nil]lastObject];
    }
    // 取出对应模型(模式需要加载数据，这里没有做数据加载，使用的时候注意)
    AXFoodInfo *mode ;
    //把模型的值传给cell
    cell.mode = mode;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
