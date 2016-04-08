//
//  LatesNews.h
//  ICar
//
//  Created by hgy on 16/4/7.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Focuslist,Focusimgs,Newslist;

@interface LatesNews : NSObject


@property (nonatomic, strong) Focuslist *focusList;


@property (nonatomic, strong) NSArray <Newslist *>*newsList;


@end



@interface Focuslist : NSObject

@property (nonatomic, strong) NSArray<Focusimgs *> *focusImgs;

@end

@interface Focusimgs : NSObject

@property (nonatomic, copy) NSString *imgURL;

@property (nonatomic, copy) NSString *statisticsUrl;

@property (nonatomic, copy) NSString *newsLink;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *webLink;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *pubTime;

@property (nonatomic, assign) NSInteger pageNum;

@end

@interface Newslist : NSObject

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, copy) NSString *newsLink;

@property (nonatomic, copy) NSString *newsTitle;

@property (nonatomic, copy) NSString *webLink;

@property (nonatomic, copy) NSString *newsCategory;

@property (nonatomic, assign) NSInteger newsCreateTime;

@property (nonatomic, assign) NSInteger newsType;

@property (nonatomic, copy) NSString *pubTime;

@property (nonatomic, assign) NSInteger isSpread;

@property (nonatomic, copy) NSString *newsImage;

@property (nonatomic, assign) NSInteger commentCount;

@end

