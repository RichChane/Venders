//
//  LYBookStoreRequest.m
//  仿搜狗阅读
//
//  Created by DemoLi on 2017/1/16.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "LYBookStoreRequest.h"

@interface LYBookStoreRequest()

@property (nonatomic,assign) NSInteger type;

@end

@implementation LYBookStoreRequest

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
    return @{
             @"bt": @(_type),
             
             };
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGet;
    
}


@end
