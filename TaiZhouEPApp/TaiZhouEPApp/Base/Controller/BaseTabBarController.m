//
//  BaseTabBarController.m
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/5/9.
//  Copyright © 2019 snew. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "XWVideoListViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UITabBar appearance].translucent = NO; //设置tabBar背景不透明
    
    [self configChildViewController];
}

- (void)configChildViewController {
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    XWVideoListViewController *videoListVC = [[XWVideoListViewController alloc] init];
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    MineViewController *mineVC = [[MineViewController alloc] init];
    
    [self setupDetailsChildWithController:homeVC NavTitle:@"首页" TabBarTitle:@"首页" TabBarNormalImgStr:@"icon.bundle/home@2x" TabBarSelectedImgStr:@"icon.bundle/home_selected@2x"];
    [self setupDetailsChildWithController:videoListVC NavTitle:@"视频" TabBarTitle:@"视频" TabBarNormalImgStr:@"icon.bundle/video@2x" TabBarSelectedImgStr:@"icon.bundle/video_selected@2x"];
    [self setupDetailsChildWithController:messageVC NavTitle:@"推荐" TabBarTitle:@"推荐" TabBarNormalImgStr:@"icon.bundle/like@2x" TabBarSelectedImgStr:@"icon.bundle/like_selected@2x"];
    [self setupDetailsChildWithController:mineVC NavTitle:@"我的" TabBarTitle:@"我的" TabBarNormalImgStr:@"icon.bundle/page@2x" TabBarSelectedImgStr:@"icon.bundle/page_selected@2x"];
    
}


- (void)setupDetailsChildWithController:(UIViewController *)controller NavTitle:(NSString *)navTitle TabBarTitle:(NSString *)tabBarTitle TabBarNormalImgStr:(NSString *)normalImgStr TabBarSelectedImgStr:(NSString *)selectedImgStr {
    
    controller.title = navTitle;
    
    HBDNavigationController *navVC = [[HBDNavigationController alloc] initWithRootViewController:controller];
    navVC.tabBarItem.title = tabBarTitle;
    navVC.tabBarItem.image = [[UIImage imageNamed:normalImgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [navVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]} forState:UIControlStateNormal];
     [navVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:33/255.0 green:151/255.0 blue:216/255.0 alpha:1.0],NSFontAttributeName:[UIFont systemFontOfSize:12.0]} forState:UIControlStateSelected];
    
    [self addChildViewController:navVC];
    
}


@end
