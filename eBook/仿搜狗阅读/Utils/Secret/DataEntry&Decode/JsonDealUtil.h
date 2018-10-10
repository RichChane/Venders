//
//  JsonDealUtil.h
//  Zandouji
//
//  Created by laizhenjie on 15/5/20.
//  Copyright (c) 2015年 Fanyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonDealUtil : NSObject

/**
 *  字典转化为json字符串；
 *
 *  @param diction 字典
 *
 *  @return 返回json 字符串；
 */
+ (NSString *)toJsonWithObj:(id)jsonObj;

+ (id)jsonObject:(NSString *)js;



+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;
+(NSString *) jsonStringWithArray:(NSArray *)array;

+(NSString *) jsonStringWithString:(NSString *) string;

+(NSString *) jsonStringWithObject:(id) object;

@end
