//
//  MineViewController.m
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/5/11.
//  Copyright © 2019 snew. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *cellArr;
@property (nonatomic,strong) UIImageView *headerImageView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setInitNavigationStyle];
    [self setupUI];
}

- (void)setInitNavigationStyle {
    self.hbd_barAlpha = 0.0;
}

- (void)setupUI {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"mineNormalCell"];
    
    
    UIImage *image = [UIImage imageNamed:@"icon_mine_header"];
    CGFloat finallyImgH = image.size.height * self.view.width / image.size.width;
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, finallyImgH)];
    self.headerImageView.image = image;
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImageView.clipsToBounds = YES;
    [self.view insertSubview:_headerImageView aboveSubview:_tableView];
    
    if (@available(iOS 11,*)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    UIImage *image = self.headerImageView.image;
    CGFloat finallyImgH = image.size.height * self.view.width / image.size.width;
    if (self.tableView.contentInset.top == 0) {
        //调整tableView位置
        UIEdgeInsets inset = UIEdgeInsetsZero;
        if (@available(iOS 11,*)) {
            inset.bottom = self.view.safeAreaInsets.bottom;
        }
        inset.top = finallyImgH;
        self.tableView.contentInset = inset;
        self.tableView.contentOffset = CGPointMake(0, -finallyImgH);
    }
    
    if (CGRectGetHeight(self.headerImageView.frame) != finallyImgH) {
        //调整图片尺寸
        [self headerFrame];
    }
}

- (void)headerFrame {
    //确定图片的大小
    UIImage *image = self.headerImageView.image;
    CGFloat finallyImgH = image.size.height * self.view.width / image.size.width;
    CGFloat offsetY = self.tableView.contentOffset.y + self.tableView.contentInset.top;
    if (offsetY < 0) {
        DLog(@"offset <  0: %f",offsetY);
        self.headerImageView.height = finallyImgH -offsetY;
    }
    if (offsetY > 0) {
        self.headerImageView.y = - offsetY;
    }
}

#pragma mark - UITableViewDeleagte
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self headerFrame];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cellArr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineNormalCell" forIndexPath:indexPath];
    cell.textLabel.text = self.cellArr[indexPath.section][indexPath.row];
    return cell;
}

- (NSArray *)cellArr {
    if (_cellArr == nil) {
        _cellArr = @[@[@"主页",@"收藏",@"历史"],@[@"帮助与反馈",@"系统设置"]];
    }
    return _cellArr;
}





@end
