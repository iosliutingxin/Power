//
//  pageView.m
//  Powr
//
//  Created by guo on 2017/12/24.
//  Copyright © 2017年 iOS _Liu. All rights reserved.
//

#import "pageView.h"
@interface pageView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(strong,nonatomic)NSTimer *timers;

@end
@implementation pageView

#pragma mark -<初始化>
+(instancetype)pageView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

-(void)setImageNames:(NSArray *)imageNames{
    
    //当加载的图片只有一张的时候进行判断设置
    self.pageControl.hidden = (imageNames.count <=1);
    //放在多次添加图片的时候重复添加图片，每次进来的时候先进行清空
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //设置指示器的个数
    self.pageControl.numberOfPages = imageNames.count;
    //设置数据
    _imageNames =imageNames;
    for (int i = 0; i < imageNames.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        //设置imageView的内容模式
        imageView.contentMode = UIViewContentModeScaleToFill;
        //超出部分裁剪掉
        imageView.clipsToBounds = YES;
        [self.scrollView addSubview:imageView];
    
    }
}

//设置选中颜色
-(void)setCurrentColor:(UIColor *)currentColor{
    
    _currentColor = currentColor;
    self.pageControl.currentPageIndicatorTintColor = currentColor;
    
}

//设置另外颜色
-(void)setOtherColor:(UIColor *)otherColor{
    
    _otherColor = otherColor;
    self.pageControl.pageIndicatorTintColor = otherColor;
    
}


//布局子控件
-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    CGFloat W = self.scrollView.frame.size.width;
    CGFloat H = self.scrollView.frame.size.height;
    self.scrollView.contentSize = CGSizeMake(W*self.imageNames.count, 0);
    //布局scrollView的子控件
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i*W, 0, W, H);
    }
    
}

#pragma mark -<加载xib或者view后走的方法>
-(void)awakeFromNib{
    
    [super awakeFromNib];
    [self startTimers];

    
}

#pragma mark -<定时器>
-(void)startTimers{
    
    self.timers = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextImages) userInfo:nil repeats:YES];

}

//定时滚动图片
-(void)nextImages{
    
    NSInteger page = self.pageControl.currentPage + 1;
    if (page==self.pageControl.numberOfPages) {
        page=0;
    }
    CGFloat W = self.scrollView.bounds.size.width;
    self.scrollView.contentOffset = CGPointMake(page*W, 0);
    
}
//准备开始触摸滚动
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.timers invalidate];
    
}

//触摸滚动结束
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self startTimers];
}

#pragma mark -<UIScrollViewDelegate>
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger page = (int)(self.scrollView.contentOffset.x/self.scrollView.bounds.size.width +0.5);
    self.pageControl.currentPage = page;
}

@end
