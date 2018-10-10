
//
//  LYBookStoreRequestPost.m
//  仿搜狗阅读
//
//  Created by DemoLi on 2017/1/16.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "LYBookStoreRequestPost.h"
#import "APIParams.h"
#import "NSDictionary+DictEntry.h"

@implementation LYBookStoreRequestPost
{
    NSInteger _type;
}

- (id)initWithRequestType:(NSInteger)type
{
    self = [super init];
    if (self) {
        
        _type = type;
        
    }
    return self;
    
}

- (NSString *)requestUrl
{
    return [NSString stringWithFormat:@"GetMagazineLatestList"];
    
}

- (id)requestArgument {
    
    // 请求参数parameter
    NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
    
    //RequestParams
    NSMutableDictionary * requestParams = [APIParams GetRequestParamsWithInterfaceName:@"getInfoForHomePage"];
    [parameter setObject:requestParams forKey:@"RequestParams"];
    
    
    
    
    return [parameter dataEntray];
    
//    return @{
//             @"bt": @(_type),
//             
//             };
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPost;
    
}

@end
