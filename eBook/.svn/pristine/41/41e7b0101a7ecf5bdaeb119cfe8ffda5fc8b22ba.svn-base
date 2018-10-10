//
//  MDFlowLayout.m
//  MDCollectionView
//
//  Created by joey on 16/11/25.
//  Copyright © 2016年 com.joey. All rights reserved.
//

#import "MDFlowLayout.h"

@implementation MDFlowLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *oldItems = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *allItems = [[NSMutableArray alloc]initWithArray:oldItems copyItems:YES];
    
    __block UICollectionViewLayoutAttributes *headerAttributes = nil;
    
    [allItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UICollectionViewLayoutAttributes *attributes = obj;
        
        if ([attributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            headerAttributes = attributes;
        }
        else {
            [self updateCellAttributes:attributes withSectionHeader:headerAttributes];
            
        }
    }];
    
    return allItems;
}

- (void)updateCellAttributes:(UICollectionViewLayoutAttributes *)attributes withSectionHeader:(UICollectionViewLayoutAttributes *)headerAttributes {
//    CGFloat minY = CGRectGetMinY(self.collectionView.bounds) + self.collectionView.contentInset.top;
//    CGFloat maxY = attributes.frame.origin.y - CGRectGetHeight(headerAttributes.bounds);
//    CGFloat finalY = MAX(minY, maxY);
//    CGPoint origin = attributes.frame.origin;
//        
//    origin.y = finalY;
//    attributes.frame = (CGRect){origin, attributes.frame.size};
//    attributes.zIndex = attributes.indexPath.row;
//    CGPoint origin = attributes.frame.origin;
//    CGSize size = attributes.frame.size;
//    size.height = 200;
//    if (origin.y > 100) {
//        origin.y += 100;
//    }
//    attributes.frame = (CGRect){origin,size};
//
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
@end
