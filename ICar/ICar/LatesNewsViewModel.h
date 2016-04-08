//
//  LatesNewsViewModel.h
//  ICar
//
//  Created by hgy on 16/4/7.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"


@interface LatesNewsViewModel : BaseViewModel

- (NSMutableArray *)LatesNewsFocusImgArray;

- (NSString *)focusewsLinkForIndex:(NSInteger)index;

- (NSString *)newsCategoryForIndex:(NSInteger)index;

- (NSString *)newsTitleForIndex:(NSInteger)index;

- (NSString *)newsLinkForIndex:(NSInteger)index;

- (NSURL *)newsImgURLForIndex:(NSInteger)index;

- (NSInteger)newsCommentCountForIndex:(NSInteger)index;


@property (nonatomic) NSInteger rowNumber;

@property (nonatomic, assign) NSInteger offset;

@property (nonatomic, strong) NSMutableArray<Newslist *> *dataList;

@property (nonatomic, strong) NSMutableArray<Focusimgs *> *focusImgArray;

- (void)getLatesNewsWithRequestMode:(RequestMode)requestMode Type:(NSInteger)type completionHandler:(void(^)(NSError *error))completionHandler;

@end
