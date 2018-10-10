//
//  NSString+DES.h
//  DesDemo
//
//  Created by DemoLi on 14-6-10.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DES)
+(NSString *)encryptUseDES:(NSString *)plainText withKey:(NSString *)encryKey;
+(NSString *)decryptUseDES:(NSString *)cipherText withKey:(NSString *)decryKey;


@end
