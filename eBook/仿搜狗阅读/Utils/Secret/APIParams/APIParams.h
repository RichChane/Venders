//
//  APIParams.h
//  PreciousMetal
//
//  Created by DemoLi on 16/9/20.
//  Copyright © 2016年 Rich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIParams : NSObject

+(NSMutableDictionary*)GetRequestParams;

+(NSMutableDictionary*)GetRequestParamsWithInterfaceName:(NSString*)interfaceName;

@end
