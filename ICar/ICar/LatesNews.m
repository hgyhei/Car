//
//  LatesNews.m
//  ICar
//
//  Created by hgy on 16/4/7.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "LatesNews.h"

@implementation LatesNews
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"newsList":  [Newslist class]};
}
@end
@implementation Focuslist
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"focusImgs":  [Focusimgs class]};
}
@end


@implementation Focusimgs

@end


@implementation Newslist

@end


