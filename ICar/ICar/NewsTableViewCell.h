//
//  NewsTableViewCell.h
//  ICar
//
//  Created by hgy on 16/4/8.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *latesNewsImg;
@property (weak, nonatomic) IBOutlet UILabel *latestNewsTitle;
@property (weak, nonatomic) IBOutlet UILabel *latestNewsCategory;
@property (weak, nonatomic) IBOutlet UILabel *latesNewsComment;


@end
