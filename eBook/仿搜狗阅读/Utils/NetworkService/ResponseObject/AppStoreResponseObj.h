//
//  AppStoreResponseObj.h
//  ifangchou
//
//  Created by 陈小贝 on 16/3/11.
//  Copyright © 2016年 ifangchou. All rights reserved.
//


/**
 
 该类只对应使用http://itunes.apple.com/lookup?id=xxxxx去appstore上获取版本数据时使用。
 
 */

#import <Foundation/Foundation.h>

@interface AppStoreResponseObj : NSObject
/// 状态码（只有1是正确的）
@property (nonatomic, assign) NSInteger resultCount;
@property (nonatomic, strong) NSArray *results;

typedef void(^AppStoreResponseObjectResult)(AppStoreResponseObj *object);
@end
