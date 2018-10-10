//
//  MDCollectionView.h
//  MDCollectionView
//
//  Created by joey on 16/11/25.
//  Copyright © 2016年 com.joey. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MDDelete = 1,
    MDCancelDelete,
    MDMove,
    MDCancelMove,
    MDInsert,
    MDCancelInsert,
} MDMethodType;

@protocol MDCollectionViewDelegate <NSObject>

- (void)mdClickAddBookBtn;

@end


@interface MDCollectionView : UIView

@property (nonatomic, assign) MDMethodType type;
@property (nonatomic, weak) id<MDCollectionViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame
         DataSource:(NSArray *)dataSource;

@end
