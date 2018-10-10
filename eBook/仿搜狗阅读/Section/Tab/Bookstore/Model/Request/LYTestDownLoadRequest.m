//
//  LYTestDownLoadRequest.m
//  仿搜狗阅读
//
//  Created by Rich on 2017/1/15.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "LYTestDownLoadRequest.h"

@implementation LYTestDownLoadRequest
{
    NSString *_eBookId;
    
}

- (id)initWithEBookId:(NSString*)eBookId
{
    self = [super init];
    if (self) {
        _eBookId = eBookId;
    }
    return self;
    
}

- (NSString *)requestUrl
{
    return [NSString stringWithFormat:@"GetMagazineLatestList?bt=%ld",(long)_eBookId];
    
}

- (BOOL)userCDN
{
    return YES;
    
}

- (NSString *)resumableDownloadPath
{
    NSString *libPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *cachePath = [libPath stringByAppendingPathComponent:@"Cashes"];
    NSString *filePath = [cachePath stringByAppendingPathComponent:_eBookId];
    return filePath;
}


@end
