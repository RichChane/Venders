//
//  ResponseObject.h
//  ifangchou
//
//  Created by Horace.Yuan on 15/9/21.
//  Copyright (c) 2015年 ifangchou. All rights reserved.
//

#import "BaseResponseObject.h"

@interface ResponseObject : BaseResponseObject

@property (nonatomic, strong) NSDictionary *data;

typedef void(^ResponseObjectResult)(ResponseObject *object);

@end
