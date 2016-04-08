//
//  ICarTabViewController.m
//  ICar
//
//  Created by hgy on 16/4/8.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "ICarTabViewController.h"
#import "WMPageController.h"

#import "HomeLatestNewsViewController.h"
#import "HomeNewCarViewController.h"
#import "HomeTestAndCommentViewController.h"
#import "HomeGuideViewController.h"
#import "HomeMarketViewController.h"

@interface ICarTabViewController ()

@end

@implementation ICarTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMainViewController];
}
- (void)initMainViewController { NSMutableArray *homeVCs = [[NSMutableArray alloc] init];
    NSMutableArray *homeVCTitles = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        Class vcClass;
        NSString *title;
        switch (i) {
            case 0:
                vcClass = [HomeLatestNewsViewController class];
                title = @"最新";
                break;
            case 1:
                vcClass = [HomeNewCarViewController class];
                title = @"新车";
                break;
            case 2:
                vcClass = [HomeTestAndCommentViewController class];
                title = @"导购";
                break;
            case 3:
                vcClass = [HomeGuideViewController class];
                title = @"测评";
                break;
            case 4:
                vcClass = [HomeMarketViewController class];
                title = @"行情";
                break;
        }
        [homeVCs addObject:vcClass];
        [homeVCTitles addObject:title];
    }
    
    WMPageController *homeVC = [[WMPageController alloc] initWithViewControllerClasses:homeVCs andTheirTitles:homeVCTitles];
    homeVC.menuViewStyle = WMMenuViewStyleLine;
    homeVC.menuItemWidth = 66;
    homeVC.postNotification = YES;
    
    // 1.2
    NSMutableArray *bbsVCs = [[NSMutableArray alloc] init];
    NSMutableArray *bbsVCTitles = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        Class vcClass;
        NSString *title;
        switch (i) {
            case 0:
                vcClass = [HomeLatestNewsViewController class];
                title = @"精选";
                break;
            case 1:
                vcClass = [HomeLatestNewsViewController class];
                title = @"热帖";
                break;
            case 2:
                vcClass = [HomeLatestNewsViewController class];
                title = @"找论坛";
                break;
        }
        [bbsVCs addObject:vcClass];
        [bbsVCTitles addObject:title];
    }
    
    WMPageController *bbsVC = [[WMPageController alloc] initWithViewControllerClasses:bbsVCs andTheirTitles:bbsVCTitles];
    bbsVC.menuViewStyle = WMMenuViewStyleLine;
    bbsVC.menuItemWidth = 66;
    bbsVC.postNotification = YES;
    
    // 1.3
    HomeLatestNewsViewController *profileVC = [[HomeLatestNewsViewController alloc] init];
    
    // 1.4
    NSMutableArray *findVCs = [[NSMutableArray alloc] init];
    NSMutableArray *findVCTitles = [[NSMutableArray alloc] init];
    for (int i = 0; i < 2; i++) {
        Class vcClass;
        NSString *title;
        switch (i) {
            case 0:
                vcClass = [HomeLatestNewsViewController class];
                title = @"品牌找车";
                break;
            case 1:
                vcClass = [HomeLatestNewsViewController class];
                title = @"条件找车";
                break;
        }
        [findVCs addObject:vcClass];
        [findVCTitles addObject:title];
    }
    
    WMPageController *findVC = [[WMPageController alloc] initWithViewControllerClasses:findVCs andTheirTitles:findVCTitles];
    findVC.menuViewStyle = WMMenuViewStyleLine;
    findVC.menuItemWidth = 88;
    findVC.postNotification = YES;
    
    // 1.5
    NSMutableArray *salesVCs = [[NSMutableArray alloc] init];
    NSMutableArray *salesVCTitles = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++) {
        Class vcClass;
        NSString *title;
        switch (i) {
            case 0:
                vcClass = [HomeLatestNewsViewController class];
                title = @"降价";
                break;
            case 1:
                vcClass = [HomeLatestNewsViewController class];
                title = @"活动";
                break;
            case 2:
                vcClass = [HomeLatestNewsViewController class];
                title = @"车有惠";
                break;
            case 3:
                vcClass = [HomeLatestNewsViewController class];
                title = @"我报名的";
                break;
        }
        [salesVCs addObject:vcClass];
        [salesVCTitles addObject:title];
    }
    
    WMPageController *salesVC = [[WMPageController alloc] initWithViewControllerClasses:salesVCs andTheirTitles:salesVCTitles];
    salesVC.menuViewStyle = WMMenuViewStyleLine;
    salesVC.menuItemWidth = 88;

    salesVC.postNotification = YES;
    
    // 2.初始化tabBarCtr
   
  
    
    // 3.设置控制器属性
   
    [self addChildVc:homeVC title:@"首页" image:@"tab_shouye_baitian" selectedImage:@"tab_shouye_baitian_hit"];
    [self addChildVc:bbsVC title:@"论坛" image:@"tab_luntan_baitian" selectedImage:@"tab_luntan_baitian_hit"];
    [self addChildVc:profileVC title:@"我" image:@"tabbar_me" selectedImage:@"tabbar_me"];
    [self addChildVc:findVC title:@"找" image:@"tab_zhaoche_baitian" selectedImage:@"tab_zhaoche_baitian_hit"];
    [self addChildVc:salesVC title:@"降价" image:@"tab_jiangjia_baitian" selectedImage:@"tab_jiangjia_baitian_hit"];
    // 改变UITabBarItem字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:GYColor(43, 177, 223),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title;
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
    
}


@end
