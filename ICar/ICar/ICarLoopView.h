//
//  ICarLoopView.h
//  ICar
//
//  Created by hgy on 16/4/8.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ICarLoopView;

@protocol ICarLoopViewDelegate <NSObject>
@optional
- (void)loopViewDidSelectedImage:(ICarLoopView *)loopView index:(int)index;
@end

@interface  ICarLoopView : UIView

@property (nonatomic, weak) id<ICarLoopViewDelegate> delegate;
@property (nonatomic, assign) BOOL autoPlay;
@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, strong) NSArray *images;

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images autoPlay:(BOOL)isAuto delay:(NSTimeInterval)timeInterval;

- (void)setLoopViewImages:(NSArray *)images autoPlay:(BOOL)isAuto delay:(NSTimeInterval)timeInterval;
@end
