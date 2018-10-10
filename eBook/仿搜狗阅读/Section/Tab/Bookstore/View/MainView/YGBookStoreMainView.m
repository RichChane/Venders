//
//  YGBookStoreMainView.m
//  仿搜狗阅读
//
//  Created by Rich on 2016/12/10.
//  Copyright © 2016年 YinTokey. All rights reserved.
//

#import "YGBookStoreMainView.h"
#import "SDCycleScrollView.h"
#import "CollectionSelectView.h"
#import "BookStoreCollectionView.h"
#import "BookStoreFlowLayout.h"

@interface YGBookStoreMainView()<SDCycleScrollViewDelegate>

@property (weak, nonatomic) IBOutlet SDCycleScrollView *adScrollView;
@property (nonatomic,strong) BookStoreCollectionView *collectionSelectView;

@end

static const CGFloat adViewHeight = 170;
static CGFloat cellWidth = 82;
static CGFloat cellHeight = 110;

@implementation YGBookStoreMainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createAdScrollView];
        [self createCollectionSelectView];
        
    }
    return self;
}

- (void)createAdScrollView
{
    const CGFloat width = SCREEN_WIDTH;
    const CGFloat height = adViewHeight;
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

- (void)createCollectionSelectView
{
    
    
    const CGFloat width = SCREEN_WIDTH;
    const CGFloat height = self.height - adViewHeight;
    const CGFloat originX = 0;
    const CGFloat originY = CGRectGetMaxY( _adScrollView.frame);
    CGRect frame = CGRectMake(originX, originY, width, height);
    
    cellWidth = (SCREEN_WIDTH - 10*2 - 4*10 )/4;
    cellHeight = cellWidth *1.3;
    BookStoreFlowLayout *flowLayout = [[BookStoreFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 10.0f;//上下高度
    flowLayout.minimumInteritemSpacing = 10;//左右高度
    flowLayout.itemSize = CGSizeMake(cellWidth, cellHeight);
    
    _collectionSelectView = [[BookStoreCollectionView alloc]initWithFrame:frame collectionViewLayout:flowLayout];
    
    [self addSubview:_collectionSelectView];//为了美观暂时屏蔽
    
    
}



#pragma mark - set data

- (void)setAdData:(NSArray*)adImages
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
