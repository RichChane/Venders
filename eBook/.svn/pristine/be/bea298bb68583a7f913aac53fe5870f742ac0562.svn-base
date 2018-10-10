//
//  BookStoreCollectionDelegate.m
//  仿搜狗阅读
//
//  Created by Rich on 2017/1/12.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "BookStoreCollectionDelegate.h"
#import "BookStoreCollectionCell.h"
#import "BookStoreHeaderView.h"


@implementation BookStoreCollectionDelegate

- (instancetype)initWithRegisterCell:(UICollectionViewCell*)cell
{
    self = [super init];
    if (self) {
        
        
        
        
    }
    return self;
}

#pragma mark - datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 8;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof BookStoreCollectionCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    BookStoreCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.identifyCell forIndexPath:indexPath];
    
    
    return cell;
}

#pragma mark - delegate

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    BookStoreHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:self.identifyHeader forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        headerView.headerTitle = @"其他";
        
    }
    else if (indexPath.section == 1) {
        headerView.headerTitle = @"推荐";
        
    }
    else if (indexPath.section == 2) {
        headerView.headerTitle = @"热门";
        
    }
    
    return headerView;
    
}

#pragma mark - 这两个方法貌似不是系统方法
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 5, 10);
}

//这个方法是返回 Header的大小 size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(SCREEN_WIDTH, 30);
}


#pragma mark - set & get

- (NSString*)identifyCell
{
    return @"identifyCell";
}

- (NSString*)identifyHeader
{
    return @"identifyHeader";
}

@end


