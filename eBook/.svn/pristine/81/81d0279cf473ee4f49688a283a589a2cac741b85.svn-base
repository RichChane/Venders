//
//  LYGetInfoAccordTimeRequest.m
//  仿搜狗阅读
//
//  Created by Rich on 2017/1/14.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "LYGetInfoAccordTimeRequest.h"

@implementation LYGetInfoAccordTimeRequest
{
    NSString *_userId;
}

- (id)initWithUserId:(NSString *)userId {
    self = [super init];
    if (self) {
        _userId = userId;
    }
    return self; 
}

- (NSString *)requestUrl {
    return @"/iphone/users";
}

- (id)requestArgument {
    return @{ @"id": _userId };
}

- (id)jsonValidator {
    return @{
             @"nick": [NSString class],
               @"level": [NSNumber class]
               };
}

//设置请求时长 -- cacheTimeInSeconds方法，给 GetUserInfoApi 增加了一个3分钟的缓存，3分钟内调用调Api的start方法，实际上并不会发送真正的请求。
- (NSInteger)cacheTimeInSeconds {
    // 3分钟 = 180 秒 
    return 60 * 3; 
}


@end
