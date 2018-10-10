//
//  NetworkService.m
//  ifangchou
//
//  Created by mac on 16/1/9.
//  Copyright © 2016年 ifangchou. All rights reserved.
//

#import "NetworkService.h"
//#import "Security.h"
//#import "URLconfig.h"
//#import "BaseDataModel.h"
#import "NSDictionary+DictEntry.h"
#import "ParseData.h"
#import "UserErrorInfo.h"
//#import "NetworkErrorManager.h"

#define Version @1
#define TimeOut 30


static  AFHTTPRequestOperationManager *afManager = nil;

@implementation NetworkService

+ (AFHTTPRequestOperationManager*)sharedAfManager
{
    static id afManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        afManager = [AFHTTPRequestOperationManager manager];
    });
    return afManager;
}


-(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

#pragma mark - 单个图片上传

- (void)uploadimgWithurl:(NSString *)urlStr
                   image:(UIImage *)image
                fileName:(NSString *)fileName
                param:(NSDictionary *)param
                 success:(void (^)(id responseObject))success
                    fail:(void (^)())fail
{
    param = [param dataEntray].copy;//加密
    //需要传递的参数,jason格式
    // manager
//    AFHTTPRequestOperationManager *manager = [NetworkService sharedAfManager];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // Serializers
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:TimeOut];
    
    [manager POST:urlStr parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        /*文件命名参考代码
         // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
         // 要解决此问题，
         // 可以在上传时使用当前的系统事件作为文件名
         NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
         // 设置时间格式
         formatter.dateFormat = @"yyyyMMddHHmmss";
         NSString *str = [formatter stringFromDate:[NSDate date]];
         NSString *newfileName = [NSString stringWithFormat:@"%@.png", str];
         */
        [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:@"uploadFile" fileName:fileName mimeType:@"image/png"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            //NSLog(@"success\n");
            
            
            NSString *aString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSDictionary *decodingMessageDict = [ParseData parseDataWithData:aString];
            NSLog(@"%@", [decodingMessageDict description]);
            
            success(decodingMessageDict);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (fail) {
            //NSLog(@"fail\n");
            fail(nil,error);
        }
    }];
}

- (void)POST:(NSString *)urlString
  parameters:(id)parameters
responseClass:(Class)aClass
     success:(void (^)(id))success
     failure:(void (^)(NSError *))failure
{
    
    // manager
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestOperationManager *manager = [NetworkService sharedAfManager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"html", nil];
    [manager.requestSerializer setTimeoutInterval:TimeOut];
    
//    NSLog(@"\n$--------------------------request url----------------------------------$\n\n%@?para=%@\n\n$-----------------------------------------------------------------------$",urlString,[parameters objectForKey:@"para"]);
    
    //parameters = [parameters dataEntray];
    //方法通过添加
    
    
    [manager POST:urlString
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         //NSDictionary * _date = responseObject;
        
         
         NSString *aString = [self DataTOjsonString:responseObject];// [[NSString alloc] initWithData:(NSData*)_date encoding:NSUTF8StringEncoding];
         
         if (aString.length<=0) {
             
             return ;
         }
         NSDictionary *decodingMessageDict = [ParseData parseDataWithData:aString];
         

         success(decodingMessageDict);
         
        //ResponseObject *response = responseObject;
        //NSLog(@"+++++++++%@",response.data);
         // 解密操作
         /*
         //[response decryptData];
         
         if ([response.data isKindOfClass:[NSDictionary class]])
         {
             NSError *parseError = nil;
             
             NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response.data options:NSJSONWritingPrettyPrinted error:&parseError];
             
             NSLog(@"\n$--------------------------%@----------------------------------$\n\n%@\n\n$----------------------------end-------------------------------------------$\n\n",urlString,[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
         }
         else
         {
             NSLog(@"\n$--------------------------%@----------------------------------$\n\n%@\n\n$----------------------------end-------------------------------------------$\n\n",urlString,response.data);
         }

          */
         
         
//         if (response.status == -99)
//         {
//             [self performSelector:@selector(handleSessionExpired) withObject:nil afterDelay:0.2f];
//             return;
//             
//         }
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         
         failure(error);
     }];
}

- (void)POSTInBody:(NSString *)urlString
        parameters:(NSDictionary *)parameters
     responseClass:(Class)aClass
           success:(void (^)(id))success
           failure:(void (^)(NSError *))failure
{
    // manager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // Serializers
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    [requestSerializer setTimeoutInterval:TimeOut];
    
    AFJSONResponseSerializer *responseSerializer = [[MUResponseSerializer alloc] initWithResponseClass:aClass];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/plain", nil];
    
    // set Serializers
    [manager setRequestSerializer:requestSerializer];
    [manager setResponseSerializer:responseSerializer];
    
    // parameter
    NSMutableDictionary *requestParams = [parameters mutableCopy];
    NSMutableDictionary *formDataDict = [NSMutableDictionary dictionary];
    NSArray *keys = [requestParams allKeys];
    for (NSString *key in keys)
    {
        if ([[parameters valueForKey:key] isKindOfClass:[UIImage class]])
        {
            UIImage *imageParam = [parameters valueForKey:key];
            [requestParams setValue:nil forKey:key];
            [formDataDict setValue:imageParam forKey:key];
        }
    }
    NSLog(@"\n$--------------------------request url----------------------------------$\n\n%@?para=%@\n\n$-----------------------------------------------------------------------$",urlString,[requestParams objectForKey:@"para"]);
    
    parameters = [parameters dataEntray];
    
    // post
    [manager POST:urlString parameters:requestParams
constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
     {
         if ([formDataDict count] > 0)
         {
             NSArray *formDataKeyArray = [formDataDict allKeys];
             for (NSString *formDataKey in formDataKeyArray)
             {
                 UIImage *image = [formDataDict valueForKey:formDataKey];
                 NSData *imgData = UIImageJPEGRepresentation(image, 1);
                 
                 // 要上传保存在服务器中的名称
                 // 使用时间来作为文件名 2014-04-30 14:20:57.png
                 // 让不同的用户信息,保存在不同目录中
                 NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                 // 设置日期格式
                 formatter.dateFormat = @"yyyyMMddHHmmss";
                 NSString *fileNameStr = [formatter stringFromDate:[NSDate date]];
                 NSString *fileName = [fileNameStr stringByAppendingString:@".jpeg"];
                 
                 [formData appendPartWithFileData:imgData
                                             name:formDataKey
                                         fileName:fileName
                                         mimeType:@"image/jpeg"];
             }
         }
         
     }
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         BaseResponseObject *response = responseObject;
         
         // 解密操作
         [response decryptData];
         success(responseObject);
         
         if (response.status == -99)
         {
             [self performSelector:@selector(handleSessionExpired) withObject:nil afterDelay:0.2f];
             return;
         }
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         failure(error);
     }];
    
}

- (NSString *)getTimeStamp
{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;  //  *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a]; //转为字符型
    
    return timeString;
}

- (void)GetForVersionCheck:(NSString *)urlString
  parameters:(id)parameters success:(void (^)(id))success
     failure:(void (^)(NSError *))failure
{

    
   
    /*
     * desc  : GET请求
     * param : URLString - 请求的地址
     *          parameters - 请求参数（GET请求，参数可以为nil 或者 可以提交一个时间戳）
     *          success - 请求成功回调的block
     *          failure - 请求失败回调的block
     */
    
    // 初始化请求的manager对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setTimeoutInterval:TimeOut];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        // 处理请求成功，服务器返回的JSON数据
        if (responseObject) {
            
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"err:%@.", error);
    }];
    
   
}

/**
 
 RequestParams.platform
 int
 true
 
 1:安卓 2:ios
 RequestParams.version
 string
 true
 
 版本号:1.0
 RequestParams.imei
 string
 false
 
 imei码
 RequestParams.deviceId
 string
 false
 
 设备id
 RequestParams.RegistrationID
 string
 false
 
 极光推送注册id
 
 
 
 **/






- (NSMutableDictionary *)packupParameterWithDictionary:(NSDictionary *)parameter
{
    
    

    
    NSDictionary *requestPara = nil;
    
#ifdef FCNetWorkingSecurityEnable
    NSString *headerKey = [[self class] getTimeStamp];
    NSString *encryptedString = [Security encryptedDataWithParameterDictionary:parameter
                                                                 withHeaderKey:headerKey];
    
    requestPara = @{@"identifyingCode": headerKey,
                    @"para"           : encryptedString,
                    @"interfaceVersion":Version};
    
#else
    NSData *data = [NSJSONSerialization dataWithJSONObject:parameter
                                                   options:0
                                                     error:nil];
    NSString *JsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    // requestPara
    requestPara = @{@"para":JsonStr,
                    @"interfaceVersion":Version};
    
#endif
    
    return requestPara.copy;
     
    
}

- (void)handleSessionExpired
{
//    //logout
//    
//    if ([BaseDataModel sharedModel].userId == 0)//若已经logout则不作logout处理
//    {
//        return;
//    }
//    
//    
//    [[NSNotificationCenter defaultCenter] postNotificationName:SessionExpiredNotification
//                                                        object:nil];
}

@end
