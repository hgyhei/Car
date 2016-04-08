//
//  NetManager.m
//  ICar
//
//  Created by hgy on 16/4/7.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager

+ (void)getLatesNewsWithOffset:(NSInteger)offset Type:(NSInteger)type completionHandler:(void (^)(LatesNews *model, NSError *error))completionHandler{
    NSDictionary *pa = @{@"limit": @10,
                         @"offset": @(offset),
                         @"type": @(type),
                         };
    NSString *path = kGetCarNewsURL;
    [self GET:path parameters:pa progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([LatesNews parseJSON:responseObj], error);
    }];
}


@end
