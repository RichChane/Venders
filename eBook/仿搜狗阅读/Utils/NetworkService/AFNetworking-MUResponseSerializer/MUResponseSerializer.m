//
//  MUJSONSerializer.m
//  Paragraph
//
//  Created by Martin Ulianko on 08/03/14.
//  Copyright (c) 2014 Martin Ulianko. All rights reserved.
//

#import "MUResponseSerializer.h"

@implementation MUResponseSerializer {}


- (instancetype)initWithResponseClass:(Class)aClass
{
    if(self = [super init])
    {
        self.responseObjectClass = aClass;
    }
    return self;
}

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    id responseObject = [super responseObjectForResponse:response data:data error:error];
    
    // array
    //
    if ([responseObject isKindOfClass:[NSArray class]])
    {
        NSMutableArray *objects = [NSMutableArray new];
        
        for(id item in responseObject)
        {
            [objects addObject:[[[self responseObjectClass] alloc] initWithJSON:item]];
        }
        
        responseObject = objects;
    }
    
    // dictionary
    //
    else {
        responseObject = [[[self responseObjectClass] alloc] initWithJSON:responseObject];
    }
    
    return responseObject;
}

@end