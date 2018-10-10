//
//  NSDictionary+DictEntry.m
//  PreciousMetal
//
//  Created by DemoLi on 16/9/18.
//  Copyright © 2016年 Rich. All rights reserved.
//

#import "NSDictionary+DictEntry.h"
#import "JsonDealUtil.h"
#import "CRSA.h"
#import "NSString+DES.h"

//接口配置
#define KRDATA @"rData"
#define KRKEY @"rKey"
#define KRKEY_VALUE @"rKey_value"

@implementation NSDictionary (DictEntry)

#pragma mark -  RequestArgs 做加密
-(NSDictionary*)dataEntray
{
    NSString *jsonString = [JsonDealUtil toJsonWithObj:self];
    //NSLog( @"jsonString : %@",jsonString);
    NSString * randString = [self randString];
    NSString * rKeyValueString = [[CRSA shareInstance] encryptByRsa:randString withKeyType:KeyTypePublic];
    NSString * rDataValueString = [NSString encryptUseDES:jsonString withKey:randString];
    NSDictionary * finalDic = [[NSDictionary alloc]initWithObjectsAndKeys:rKeyValueString,KRKEY,rDataValueString,KRDATA,@"123",@"switch", nil];
    
    return finalDic;
}



#pragma mark -  RequestArgs 做加密
-(NSDictionary*)dataEntrayEx
{
    NSString *jsonString = [JsonDealUtil toJsonWithObj:self];
    NSLog( @"jsonString : %@",jsonString);
    NSString * randString = [self randString];
    NSString * rKeyValueString = [[CRSA shareInstance] encryptByRsa:randString withKeyType:KeyTypePublic];
    NSString * rDataValueString = [NSString encryptUseDES:jsonString withKey:randString];
    NSDictionary * finalDic = [[NSDictionary alloc]initWithObjectsAndKeys:rKeyValueString,KRKEY,rDataValueString,KRDATA,@"123",@"switch", nil];
    
    
    NSMutableDictionary * m_dic = [[NSMutableDictionary  alloc]init];
    
    [m_dic setObject:randString forKey:@"key"];
    [m_dic setObject:rDataValueString forKey:@"value"];
    return m_dic;
}



#pragma mark -----------------Praivate  Method----------
// 随机字符串
- (NSString *)randString
{
    NSMutableString * resultString = [[NSMutableString alloc]init];
    for (int i = 0; i < 8; i++) {
        NSString * smallString;
        int num = arc4random()%2;
        if (num == 0) {                                     //输入数字
            smallString = [NSString stringWithFormat:@"%d",arc4random()%10];
        }else{                                              //输入字符串
            char c = arc4random()%26+65;
            smallString = [NSString stringWithFormat:@"%c",c];
        }
        [resultString appendString:smallString];
    }
    return resultString;
}


@end
