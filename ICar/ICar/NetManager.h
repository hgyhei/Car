//
//  NetManager.h
//  ICar
//
//  Created by hgy on 16/4/7.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LatesNews.h"

@interface NetManager : NSObject

+ (void)getLatesNewsWithOffset:(NSInteger)offset Type:(NSInteger)type completionHandler:(void(^)(LatesNews *model,NSError *error))completionHandler;




@end
