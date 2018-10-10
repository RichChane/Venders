//
//  BookStoreCollectionView.m
//  仿搜狗阅读
//
//  Created by Rich on 2017/1/12.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "BookStoreCollectionView.h"
#import "BookStoreCollectionDelegate.h"
#import "BookStoreCollectionCell.h"
#import "BookStoreHeaderView.h"

@interface BookStoreCollectionView()

@property (nonatomic,strong) BookStoreCollectionDelegate *collectionDelegate;

@end

@implementation BookStoreCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        _collectionDelegate = [[BookStoreCollectionDelegate alloc]init];
        
        self.delegate = _collectionDelegate;
        self.dataSource = _collectionDelegate;
        //注册cell
        [self registerClass:[BookStoreCollectionCell class] forCellWithReuseIdentifier:_collectionDelegate.identifyCell];
        [self registerClass:[BookStoreHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:_collectionDelegate.identifyHeader];
        

        
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
