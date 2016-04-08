//
//  BaseViewModel.h
//  ICar
//
//  Created by hgy on 16/4/8.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"
typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh, //刷新数据
    RequestModeMore, //获取更多数据
};
@interface BaseViewModel : NSObject

@end
