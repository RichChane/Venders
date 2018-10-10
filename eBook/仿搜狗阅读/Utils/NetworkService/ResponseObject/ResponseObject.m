//
//  ResponseObject.m
//  ifangchou
//
//  Created by Horace.Yuan on 15/9/21.
//  Copyright (c) 2015年 ifangchou. All rights reserved.
//

#import "ResponseObject.h"
//#import "Security.h"

@implementation ResponseObject

@synthesize data;

//@override
- (void)decryptData
{
#ifdef FCNetWorkingSecurityEnable
    if (identifyingCode.length > 0)
    {
        id responseData = [Security decryptedDataWithDataString:(NSString *)self.data
                                                  withHeaderKey:identifyingCode];
        data = responseData;
    }
#endif
}

@end
