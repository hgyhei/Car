//
//  LatesNewsViewModel.m
//  ICar
//
//  Created by hgy on 16/4/7.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "LatesNewsViewModel.h"

@implementation LatesNewsViewModel

- (NSMutableArray<Focusimgs *> *)focusImgArray{
    if (!_focusImgArray) {
        _focusImgArray = [NSMutableArray new];
    }
    return _focusImgArray;
}

- (NSMutableArray<Newslist *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

- (NSMutableArray *)LatesNewsFocusImgArray{
    NSMutableArray *imgArray = [NSMutableArray array];
    for (Focusimgs *model in self.focusImgArray) {
        NSString *URLStr = model.imgURL;
        NSURL *imgURL = [NSURL URLWithString:URLStr];
        [imgArray addObject:imgURL];
    }
    return imgArray;
}
- (NSString *)focusewsLinkForIndex:(NSInteger)index{
    return self.focusImgArray[index].newsLink;
}
- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (NSURL *)newsImgURLForIndex:(NSInteger)index{
    return [NSURL URLWithString:self.dataList[index].newsImage];
}

- (NSString *)newsTitleForIndex:(NSInteger)index{
    return self.dataList[index].newsTitle;
}

- (NSString *)newsCategoryForIndex:(NSInteger)index{
    return self.dataList[index].newsCategory;

}
- (NSString *)newsLinkForIndex:(NSInteger)index{
    return self.dataList[index].newsLink;
}

- (NSInteger)newsCommentCountForIndex:(NSInteger)index{
    return self.dataList[index].commentCount;
}

- (void)getLatesNewsWithRequestMode:(RequestMode)requestMode Type:(NSInteger)type completionHandler:(void (^)(NSError *))completionHandler{

    NSInteger temOffset = 0;
    if (requestMode == RequestModeMore) {
        temOffset = _offset + 10;
    }
  
    [NetManager getLatesNewsWithOffset:temOffset Type:type completionHandler:^(LatesNews *model, NSError *error) {
        if (!error) {
            _offset = temOffset;
           
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
               
            }
            [self.dataList addObjectsFromArray:model.newsList];
            if (type == 1) {
                [self.focusImgArray addObjectsFromArray:model.focusList.focusImgs];
            }
            
        }
        completionHandler(error);
    }];

}
@end
