//
//  BaseResponseObject.h
//  ifangchou
//
//  Created by mac on 16/3/21.
//  Copyright © 2016年 ifangchou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResponseObject : NSObject

/// 状态码（只有1是正确的）
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *identifyingCode;
@property (nonatomic, strong) id resultData;

/**
 若identifyingCode不为空，则返回数据为加密数据，调用 -decryptData 将data转成可解析数据
 */

- (void)decryptData;

@end
