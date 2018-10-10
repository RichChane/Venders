//
//  ArrayResponseObject.h
//  ifangchou
//
//  Created by mac on 16/3/21.
//  Copyright © 2016年 ifangchou. All rights reserved.
//

#import "BaseResponseObject.h"

@interface ArrayResponseObject : BaseResponseObject

@property (nonatomic, strong) NSArray *data;

typedef void(^ArrayResponseObjectResult)(ArrayResponseObject *object);

@end
