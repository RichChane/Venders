//
//  APIParams.m
//  PreciousMetal
//
//  Created by DemoLi on 16/9/20.
//  Copyright © 2016年 Rich. All rights reserved.
//

#import "APIParams.h"
#import "FYUDIDTools.h"
//#import "JPUSHService.h"
#import "AppDelegate.h"
#import <AdSupport/AdSupport.h>
@implementation APIParams


+(NSMutableDictionary*)GetRequestParams//:(NSString*)getConstellation
{
    NSMutableDictionary * RequestParams = [[NSMutableDictionary alloc]init];
    [RequestParams setObject:@2 forKey:@"platform"];
    // 获取版本号
    
    
    AppDelegate *appDeleg = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [RequestParams setObject:version forKey:@"version"];
    NSString * UDID = [FYUDIDTools UDID];
    NSString * IDFA = [FYUDIDTools IDFA];
    [RequestParams setObject:UDID forKey:@"imei"];
    [RequestParams setObject:IDFA forKey:@"deviceId"];
    
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    [RequestParams setObject:adId forKey:@"idfa"];
    
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    [RequestParams setObject:idfv forKey:@"idfv"];
    
    // 极光id
//    NSString * user_registrationID =  [JPUSHService registrationID];
    NSString * user_registrationID = @"";
    if (user_registrationID != nil && user_registrationID.length >0) {
        // 能获取保存
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue: user_registrationID forKey:@"registrationID"];
        
        [defaults synchronize];
        
        
    }
    else
    {
        // 不能获取到
        
      
    
    }
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    user_registrationID = [defaults objectForKey:@"registrationID"];
    
    if (user_registrationID == nil) {
        user_registrationID = @"";
    }
    
    
    
    [RequestParams setObject:user_registrationID forKey:@"RegistrationID"];
    return RequestParams;
}

+(NSMutableDictionary*)GetRequestParamsWithInterfaceName:(NSString*)interfaceName
{
    NSMutableDictionary * RequestParams = [self GetRequestParams];
    [RequestParams setObject:interfaceName?:@"" forKey:@"interfaceName"];
    return RequestParams;
}


@end
