//
//  BookStoreHeaderView.m
//  仿搜狗阅读
//
//  Created by Rich on 2017/1/12.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "BookStoreHeaderView.h"

@interface BookStoreHeaderView()

@property (nonatomic,strong) UILabel *headerTitleLabel;


@end


@implementation BookStoreHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = CUSTOM_LIGHT_GRAY_2;
        
        _headerTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(dis_LEFTSCREEN, 0, self.width - dis_LEFTSCREEN*2, self.height)];
        [self addSubview:_headerTitleLabel];
        
        
        
    }
    return self;
}

- (void)setHeaderTitle:(NSString *)headerTitle
{
    _headerTitle = headerTitle;
    _headerTitleLabel.text = headerTitle;
    
}


@end
