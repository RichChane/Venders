//
//  BookShelfHeaderView.m
//  仿搜狗阅读
//
//  Created by DemoLi on 2017/1/9.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "BookShelfHeaderView.h"
#import "SDCycleScrollView.h"
#import "SegmentTitleView.h"

@interface BookShelfHeaderView()

@property (nonatomic,strong) SDCycleScrollView *adScrollView;

@end


@implementation BookShelfHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        const CGFloat width = SCREEN_WIDTH;
        const CGFloat height = self.height - 50;
        const CGFloat originX = 0;
        const CGFloat originY = 0;
        CGRect frame = CGRectMake(originX, originY, width, height);
        
        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        self.adScrollView = cycleScrollView2;
        
        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        cycleScrollView2.backgroundColor = BlackColor;
        
        [self addSubview:cycleScrollView2];
        
        
        
        
        
    }
    return self;
}


- (void)setAdImages:(NSArray *)adImages
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _adScrollView.imageURLStringsGroup = adImages;
    });
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
