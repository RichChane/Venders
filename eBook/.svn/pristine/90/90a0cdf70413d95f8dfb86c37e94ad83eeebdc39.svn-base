//
//  MDCollectionCell.m
//  MDCollectionView
//
//  Created by joey on 16/11/25.
//  Copyright © 2016年 com.joey. All rights reserved.
//
#import "MDCollectionCell.h"
@interface MDCollectionCell()

@end

CGFloat const titleFont = 10.0f;
CGFloat const cornerRadius = 5.0f;

@implementation MDCollectionCell
@synthesize image;

- (UIButton *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
        _deleteBtn.layer.cornerRadius = 7.5f;
        _deleteBtn.layer.masksToBounds = YES;
        [_deleteBtn setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        [_deleteBtn setBackgroundColor:[UIColor whiteColor]];
        [_deleteBtn addTarget:self action:@selector(deletingAction:) forControlEvents:UIControlEventTouchUpInside];
        _deleteBtn.hidden = YES;
        [self addSubview:_deleteBtn];
        
    }
    return _deleteBtn;
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        image = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.bounds) - 10, CGRectGetHeight(self.bounds) - 10)];
        image.layer.cornerRadius = cornerRadius;
        image.layer.masksToBounds = YES;
        [image setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:image];
        
        [self setBackgroundColor:[UIColor blackColor]];
    }
    return self;
}

- (void)deletingAction:(UIButton *)sender{
    
    [self.deleteDelegate deleteCellAction:self.center];
}

@end
