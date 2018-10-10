//
//  SelectControl.m
//  仿搜狗阅读
//
//  Created by Rich on 2016/12/11.
//  Copyright © 2016年 YinTokey. All rights reserved.
//

#import "SelectControl.h"

@implementation SelectControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor greenColor];
        
        [self createImageView];
        
        
    }
    return self;
}

- (void)createImageView
{
    UIImage *image = [UIImage imageNamed:@"personalCenter_payList"];
    
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imv.image = image;
    [self addSubview:imv];
    
    CGFloat titleLabelHeight = 20;
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imv.frame.size.height, self.frame.size.width, titleLabelHeight)];
    titleLabel.text = @"时间管理";
    [self addSubview:titleLabel];
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
