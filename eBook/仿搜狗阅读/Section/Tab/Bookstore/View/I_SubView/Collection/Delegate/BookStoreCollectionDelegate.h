//
//  BookStoreCollectionDelegate.h
//  仿搜狗阅读
//
//  Created by Rich on 2017/1/12.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BookStoreCollectionDelegate : NSObject<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) NSString* identifyCell;
@property (nonatomic,strong) NSString* identifyHeader;

@end
