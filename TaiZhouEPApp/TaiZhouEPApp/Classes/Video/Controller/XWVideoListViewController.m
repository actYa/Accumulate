//
//  XWVideoListViewController.m
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/11/22.
//  Copyright © 2019 snew. All rights reserved.
//

#import "XWVideoListViewController.h"
#import "XWVideoListCoverView.h"
#import "XWVideoToolbar.h"

@interface XWVideoListViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation XWVideoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.width / 16 * 9 + XWVideoToolbarHeight);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
    //register cell
    [self.collectionView registerClass:[XWVideoListCoverView class] forCellWithReuseIdentifier:@"videoListCover"];
    
}

#pragma mark - UICollectionViewDelegate


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"videoListCover" forIndexPath:indexPath];
    if ([cell isKindOfClass:[XWVideoListCoverView class]]) {
        [(XWVideoListCoverView *)cell layoutWithVideoCoverUrl:@"videoCover" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    return cell;
}


@end
