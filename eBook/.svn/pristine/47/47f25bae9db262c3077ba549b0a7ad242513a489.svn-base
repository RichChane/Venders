//
//  BookStoreRequest.m
//  仿搜狗阅读
//
//  Created by DemoLi on 2017/1/16.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "BookStoreRequest.h"
#import "APIParams.h"
#import "NSDictionary+DictEntry.h"

@implementation BookStoreRequest

#pragma mark - 用主页测试
- (void)getInfoForHomePageWithParam:(NSDictionary*)param withSuccess:(ResponseObjectResult)success
                         failure:(FailureBlock)failure
{
    // 请求参数parameter
    NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
    
    //RequestParams
    NSMutableDictionary * requestParams = [APIParams GetRequestParamsWithInterfaceName:@"getInfoForHomePage"];
    [parameter setObject:requestParams forKey:@"RequestParams"];
    
    // url
    NSString *url = url_path;
    NetworkService *service = [[NetworkService alloc] init];
    
    // 发送请求
    [service POST:url
       parameters:parameter
    responseClass:[ResponseObject class]
          success:^(ResponseObject *object)
     {
         success(object);
     }
          failure:failure];
}

#pragma mark - 书城 -- 目前得不到数据
- (void)getBookStoreInfoWithParam:(NSDictionary*)param withSuccess:(ResponseObjectResult)success
                            failure:(FailureBlock)failure
{
    // 请求参数parameter
    NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
    
    //RequestParams
    
    [parameter setObject:@0 forKey:@"bt"];
    
    // url
    //http://120.76.99.94:8080/ReadPaper/GetMagazineLatestList?bt=0
    NSString *url = @"http://120.76.99.94:8080/ReadPaper/GetMagazineLatestList";
    NetworkService *service = [[NetworkService alloc] init];
    
    // 发送请求
    [service POST:url
       parameters:parameter
    responseClass:[ResponseObject class]
          success:^(ResponseObject *object)
     {
         success(object);
     }
          failure:failure];
}


@end
