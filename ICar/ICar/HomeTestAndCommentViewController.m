//
//  HomeTestAndCommentViewController.m
//  ICar
//
//  Created by hgy on 16/4/8.
//  Copyright © 2016年 hgy. All rights reserved.
//

#import "HomeTestAndCommentViewController.h"

@interface HomeTestAndCommentViewController ()

@end

@implementation HomeTestAndCommentViewController
- (instancetype)init{
    self = [super init];
    if (self) {
      self.homeNewsURLType = HomeTestAndCommentURLType;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
