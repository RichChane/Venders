//
//  LYGetInfoAccordTimeRequest.h
//  仿搜狗阅读
//
//  Created by Rich on 2017/1/14.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "YTKRequest.h"

//覆盖 cacheTimeInSeconds方法，给 GetUserInfoApi 增加了一个3分钟的缓存，3分钟内调用调Api的start方法，实际上并不会发送真正的请求。
@interface LYGetInfoAccordTimeRequest : YTKRequest

@end
