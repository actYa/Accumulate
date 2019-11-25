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
    
    [self setupDetailsChildWithController:homeVC NavTitle:@"首页" TabBarTitle:@"首页" TabBarNormalImgStr:@"icon_tab_home_normal" TabBarSelectedImgStr:@"icon_tab_home_pressed"];
    [self setupDetailsChildWithController:videoListVC NavTitle:@"视频" TabBarTitle:@"视频" TabBarNormalImgStr:@"icon_tab_session_normal" TabBarSelectedImgStr:@"icon_tab_session_pressed"];
    [self setupDetailsChildWithController:messageVC NavTitle:@"消息" TabBarTitle:@"消息" TabBarNormalImgStr:@"icon_tab_circle_normal" TabBarSelectedImgStr:@"icon_tab_circle_pressed"];
    [self setupDetailsChildWithController:mineVC NavTitle:@"我的" TabBarTitle:@"我的" TabBarNormalImgStr:@"icon_tab_me_normal" TabBarSelectedImgStr:@"icon_tab_me_pressed"];
    
    
    
    
}


- (void)setupDetailsChildWithController:(UIViewController *)controller NavTitle:(NSString *)navTitle TabBarTitle:(NSString *)tabBarTitle TabBarNormalImgStr:(NSString *)normalImgStr TabBarSelectedImgStr:(NSString *)selectedImgStr {
    
    controller.title = navTitle;
    
    HBDNavigationController *navVC = [[HBDNavigationController alloc] initWithRootViewController:controller];
    navVC.tabBarItem.title = tabBarTitle;
    navVC.tabBarItem.image = [[UIImage imageNamed:normalImgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [navVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:12.0]} forState:UIControlStateNormal];
     [navVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:12.0]} forState:UIControlStateSelected];
    
    [self addChildViewController:navVC];
    
}


@end
