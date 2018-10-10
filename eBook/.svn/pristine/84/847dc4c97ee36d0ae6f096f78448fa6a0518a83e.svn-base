//
//  UserErrorInfo.m
//  PreciousMetal
//
//  Created by Fan ao on 16/10/17.
//  Copyright © 2016年 Rich. All rights reserved.
//

#import "UserErrorInfo.h"
//#import "WPUserInfo.h"
@implementation UserErrorInfo

+(BOOL)ShowErrorInfo:(NSDictionary*)date_dic
{

    //         2008 => '账号受限',
    //         2009 => '账号未登录或已在别的设备登录',
    //         2011 => '账号已被封',
    
    
    NSDictionary *_Result_dic = [date_dic objectForKey:@"Result"];
    NSString *resultCode = [_Result_dic objectForKey:@"resultCode"];
    //NSString * err_info = [ErrorInfoList GetError:[resultCode integerValue]];
    
//    if ([resultCode intValue] == 2008 || [resultCode intValue] == 2009 || [resultCode intValue] == 2011) {
//        NSString *resultDescr = [_Result_dic objectForKey:@"resultDescr"];
//        [GMUtils showTipsWithHUD:resultDescr showTime:1];
//        
//        
//        //
//        
//        if ([resultCode intValue] == 2009 || [resultCode intValue] == 2011) {
//             [WPUserInfo ClearUserInfo];
//        }
//        
//        
//        
//        return YES;
//        
//    }
    
    
    NSString *resultDescr = [_Result_dic objectForKey:@"resultDescr"];
    if (resultDescr && ![resultDescr isEqualToString:@""] && ![resultDescr isEqualToString:@"接口不存在"])
    {
        [GMUtils showTipsWithHUD:resultDescr showTime:1];
    }
    

//    if ([resultCode intValue] == 2009 || [resultCode intValue] == 2011) {
//        [WPUserInfo ClearUserInfo];
//    }
    
    return NO;

}

@end
