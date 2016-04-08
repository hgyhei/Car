//
//  HomeLatestNewsViewController.h
//  ICar
//
//  Created by hgy on 16/4/8.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, HomeNewsURLType) {
    HomeLatestNewsURLType      = 1,
    HomeNewCarURLType          = 2,
    HomeTestAndCommentURLType  = 3,
    HomeGuideURLType           = 4  ,
    HomeMarketURLType          = 5
};

@interface HomeLatestNewsViewController : UITableViewController
@property (nonatomic,assign) HomeNewsURLType homeNewsURLType;

@end
