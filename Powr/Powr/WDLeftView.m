//
//  WDLeftView.m
//  网易新闻
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 winter. All rights reserved.
//

#import "WDLeftView.h"
#import "Masonry.h"
@interface WDLeftView()
@property(nonatomic,weak)UIButton *button;
@end

@implementation WDLeftView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //添加子控件
        [self setUpButtonWith:@"sidebar_nav_share" title:@"分享" color:[UIColor clearColor]];
        [self setUpButtonWith:@"sidebar_nav_other" title:@"其他" color:[UIColor clearColor]];
//        [self setUpButtonWith:@"sidebar_nav_photo" title:@"图片" color:[UIColor blueColor]];
//        [self setUpButtonWith:@"sidebar_nav_video" title:@"视频" color:[UIColor greenColor]];
//        [self setUpButtonWith:@"sidebar_nav_comment" title:@"跟帖" color:[UIColor yellowColor]];
//        [self setUpButtonWith:@"sidebar_nav_radio" title:@"声音" color:[UIColor purpleColor]];
        
 
    }
    return self;
}

- (void)setUpButtonWith:(NSString *)imageName title:(NSString *)title color:(UIColor *)color
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [btn setBackgroundImage:[self imageWithColor:color] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchDown];
    btn.backgroundColor = [UIColor clearColor];
    [self addSubview:btn];
//    return button;
}

/**
 *  利用颜色来生成一个图片
 */
-(void)layoutSubviews
{
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sidebar_bg.jpg"]];
//    [self addSubview:imageView];
//    [self sendSubviewToBack:imageView];
//    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
//
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).with.offset(padding.top);
//        make.left.equalTo(self.mas_left).with.offset(padding.left);
//        make.bottom.equalTo(self.mas_bottom).with.offset(-padding.bottom);
//        make.right.equalTo(self.mas_right).with.offset(-padding.right);
//    }];
    
    
    NSInteger counts = self.subviews.count;
//    NSInteger counts = 6;
    CGFloat buttonW = self.frame.size.width;
    CGFloat buttonH = self.frame.size.height / 6;
    for (int i = 0; i < counts; i++) {
        CGFloat buttonY = (i + 2) * buttonH;
        
        UIButton *btn = self.subviews[i];
        btn.tag = i-2;
        btn.frame = CGRectMake(-35, buttonY, buttonW, buttonH);
    }
}

- (void)btnDidClick:(UIButton *)btn
{
    self.button.selected = NO;
    btn.selected = YES;
    self.button = btn;
    if([self.delegate respondsToSelector:@selector(leftBtnDidClicked:)]){
        [self.delegate leftBtnDidClicked:(int)btn.tag];
    }
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGSize size = CGSizeMake(100, 100);
    CGFloat rectW = 100;
    CGFloat rectH = 100;
    //设置基于位图的图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    [color set];
    UIRectFill(CGRectMake(0, 0, rectW, rectH));
    
    //从图形上下文中取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
