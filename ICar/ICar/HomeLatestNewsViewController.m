//
//  HomeLatestNewsViewController.m
//  ICar
//
//  Created by hgy on 16/4/8.
//  Copyright © 2016年 hgy. All rights reserved.
//
#import "HomeLatestNewsViewController.h"
#import "ICarWebViewController.h"
#import "LatesNewsViewModel.h"
#import "ICarLoopView.h"
#import "NewsTableViewCell.h"
@interface HomeLatestNewsViewController ()<ICarLoopViewDelegate>
@property (nonatomic,strong) LatesNewsViewModel *latesNewsVM;
@property (nonatomic,strong) ICarLoopView *loopView;
@property (nonatomic, strong) NSMutableArray *imgsArr;
@end

@implementation HomeLatestNewsViewController
#pragma mark - lazy load
- (NSMutableArray *)imgsArr{
    if (!_imgsArr) {
        _imgsArr = [NSMutableArray new];
    }
    return _imgsArr;
}
- (LatesNewsViewModel *)latesNewsVM{
    if (!_latesNewsVM) {
        _latesNewsVM = [LatesNewsViewModel new];
    }
    return _latesNewsVM;
}
#pragma mark - 配置
- (instancetype)init{
    self = [super init];
    if (self) {
            _homeNewsURLType = HomeLatestNewsURLType;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableview];
    [self setRefresh];
}
- (void)setTableview{

    if (_homeNewsURLType == 1) {
        [self setLoopView];
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"news"];
    self.tableView.rowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setLoopView{
    
    ICarLoopView *loopView = [[ICarLoopView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.width / 1.8f)];
    loopView.delegate = self;
    self.tableView.tableHeaderView = loopView;
    self.loopView = loopView;
    
}
- (void)setRefresh{

    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [weakSelf.latesNewsVM getLatesNewsWithRequestMode:RequestModeRefresh Type:weakSelf.homeNewsURLType completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"error");
            }
            else{
                [weakSelf setupTableHeaderViewWithFocusNews];
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
        
    }];
    [self.tableView beginHeaderRefresh];
    
    
    [self.tableView addBackFooterRefresh:^{
        [weakSelf.latesNewsVM getLatesNewsWithRequestMode:RequestModeMore Type:weakSelf.homeNewsURLType completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"error");
            }
            else{
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endFooterRefresh];
        }];
    }];

}
- (void)setupTableHeaderViewWithFocusNews{
    // 异步下载图片
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSMutableArray *array = [self.latesNewsVM LatesNewsFocusImgArray];
        for (NSURL *url in array) {
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
            [self.imgsArr addObject:image];
        }
        
    // 当图片下载完成后，在主线程设置tableHeaderView的数据
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.loopView setLoopViewImages:self.imgsArr autoPlay:YES delay:3.0];
        });
    });
}

#pragma mark - Table view datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.latesNewsVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"news" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    [cell.latesNewsImg sd_setImageWithURL:[self.latesNewsVM newsImgURLForIndex:row] placeholderImage:[UIImage imageNamed:@"zhanwei2_1"]];
    cell.latestNewsTitle.text = [self.latesNewsVM newsTitleForIndex:row];
    if ([self.latesNewsVM newsCategoryForIndex:row]) {
         cell.latestNewsCategory.text = [self.latesNewsVM newsCategoryForIndex:row];
    }
    else{
     cell.latestNewsCategory.text = @"爱卡汽车";
    }
   
    NSInteger count = [self.latesNewsVM newsCommentCountForIndex:row];
    cell.latesNewsComment.text = [NSString stringWithFormat:@"评论：%ld",count];
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    ICarWebViewController *webVC = [[ICarWebViewController alloc]init];
    webVC.urlStr = [self.latesNewsVM newsLinkForIndex:row];
    [self.navigationController pushViewController:webVC animated:YES];

}
#pragma mark - Loop View delegate
- (void)loopViewDidSelectedImage:(ICarLoopView *)loopView index:(int)index {
    ICarWebViewController *webVC = [[ICarWebViewController alloc]init];
    webVC.urlStr = [self.latesNewsVM focusewsLinkForIndex:index];
    [self.navigationController pushViewController:webVC animated:YES];
}
@end
