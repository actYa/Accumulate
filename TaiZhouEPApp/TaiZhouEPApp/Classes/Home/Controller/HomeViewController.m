//
//  HomeViewController.m
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/5/11.
//  Copyright © 2019 snew. All rights reserved.
//

#import "HomeViewController.h"
#import "XWNewsListLoader.h"
#import "XWNewsTableViewCell.h"
#import "XWNewsDetailViewController.h"
#import "XWListItem.h"
#import "XWMediator.h"


@interface HomeViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) XWNewsListLoader *loader;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void)setupUI {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    self.loader = [[XWNewsListLoader alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.loader loadListDataWithFinishBlock:^(BOOL success, NSArray * _Nonnull dataArray) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
    
    [_tableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
 
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     XWListItem *item = self.dataArray[indexPath.row];
    //option one
//    UIViewController *detailVC = [XWMediator detailViewControllerWithUrl:item.articleUrl];
//    detailVC.title = item.title;
//    [self.navigationController pushViewController:detailVC animated:YES];
    
    //option two
//    [XWMediator openUrl:@"detail://" params:@{@"url":item.articleUrl,@"controller":self.navigationController}];
    
    //option three
    Class cls =  [XWMediator classForProtocol:@protocol(XWNewsDetailViewControllerProtocol)];
    [self.navigationController pushViewController:[[cls alloc] initWithArticleUrl:item.articleUrl] animated:YES];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XWNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[XWNewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    XWListItem *item = self.dataArray[indexPath.row];
    [cell layoutTableViewCellWithItem:item];
    
    return cell;
}

#pragma mark - 懒加载
- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSArray alloc] init];
    }
    return _dataArray;
}

@end
