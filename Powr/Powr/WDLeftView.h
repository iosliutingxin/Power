//
//  WDLeftView.h
//  网易新闻
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 winter. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WDLeftViewDelegate<NSObject>

@optional
- (void)leftBtnDidClicked:(int)tag;

@end
@interface WDLeftView : UIView
@property(nonatomic,weak)id <WDLeftViewDelegate> delegate;
@end
