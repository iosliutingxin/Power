//
//  pageView.h
//  Powr
//
//  Created by guo on 2017/12/24.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pageView : UIView
@property(nonatomic,strong)NSArray *imageNames;  /**图片数据*/
@property(nonatomic,strong)UIColor *currentColor;  /**选中颜色*/
@property(nonatomic,strong)UIColor *otherColor;  /**默认颜色*/
@property(nonatomic)double time;/**滚动时间间隔*/
+(instancetype)pageView;

@end
