//
//  CollectionSelectView.m
//  仿搜狗阅读
//
//  Created by Rich on 2016/12/10.
//  Copyright © 2016年 YinTokey. All rights reserved.
//

#import "CollectionSelectView.h"
#import "SelectControl.h"

@implementation CollectionSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat itemWidth = (SCREEN_WIDTH - 40)/4;
        CGFloat itemHeight = itemWidth*1.2;
        
        for (int i = 0; i < 8; i ++) {
            
            SelectControl *selectItem = [[SelectControl alloc]initWithFrame:CGRectMake(i%4*itemWidth, i/4*itemHeight, itemWidth, itemHeight)];
            [self addSubview:selectItem];
            
            
        }
        
        
    }
    return self;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
