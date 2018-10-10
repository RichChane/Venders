//
//  FYUDIDTools.h
//  GameSDK682
//
//  Created by DemoLi on 14-6-23.
//  Copyright (c) 2014年 DemoLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FYUDIDTools : NSObject
/*
 * @brief obtain Unique Device Identity
 */
+ (NSString*)UDID;
+ (NSString*)IDFA;
+ (NSString *)getMacAddress;

@end
