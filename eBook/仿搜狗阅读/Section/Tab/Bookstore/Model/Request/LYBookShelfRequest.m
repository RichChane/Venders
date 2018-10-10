//
//  LYBookShelfRequest.m
//  仿搜狗阅读
//
//  Created by Rich on 2017/1/14.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "LYBookShelfRequest.h"


@implementation LYBookShelfRequest
{
    
    NSString *_username;
    NSString *_password;
}

-(id)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = username;
        _password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    // “http://www.yuantiku.com” 在 YTKNetworkConfig 中设置，这里只填除去域名剩余的网址信息
    return @"/iphone/register";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
            @"username": _username,
            @"password": _password
               }; 
}


//校验
- (id)jsonValidator {
    return @{
            @"username": [NSString class],
            @"password": [NSNumber class]
               }; 
}

@end

