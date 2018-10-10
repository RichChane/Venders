//
//  LYGetImagRequest.m
//  仿搜狗阅读
//
//  Created by Rich on 2017/1/14.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "LYGetImagRequest.h"

@implementation LYGetImagRequest
{
    NSString *_imageId;
    
}

- (id)initWithImageId:(NSString *)imageId {
    
    self = [super init];
    if (self) {
        _imageId = imageId;
    }
    return self;
}

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"/iphone/images/%@", _imageId];
}

//使用CDN
- (BOOL)useCDN {
    return YES; 
}

//支持断点续传 -- 只需要覆盖 resumableDownloadPath方法，指定断点续传时文件的暂存路径即可。
//原理是把下载的data 以key为主键存入本地
- (NSString *)resumableDownloadPath {
    NSString *libPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *cachePath = [libPath stringByAppendingPathComponent:@"Caches"];
    NSString *filePath = [cachePath stringByAppendingPathComponent:_imageId];
    return filePath;
}



@end
