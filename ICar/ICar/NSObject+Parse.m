//
//  NSObject+Parse.m
//  nav
//
//  Created by hgy on 16/3/30.
//  Copyright © 2016年 hgy. All rights reserved.
//


@implementation NSObject (Parse)

- (NSString *)description {
    return [self yy_modelDescription];
}

+ (id)parseJSON:(id)json{
    if([json isKindOfClass:[NSDictionary class]]){
        return [self yy_modelWithJSON:json];
    }
    if ([json isKindOfClass:[NSArray class]]) {
        return [NSArray yy_modelArrayWithClass:[self class] json:json];
    }
    return json;
}

@end










