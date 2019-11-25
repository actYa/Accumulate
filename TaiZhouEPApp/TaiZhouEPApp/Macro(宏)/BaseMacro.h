//
//  BaseMacro.h
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/5/9.
//  Copyright © 2019 snew. All rights reserved.
//

#ifndef BaseMacro_h
#define BaseMacro_h

//分类头文件引入
#import "UIView+Extension.h"

//app主色调 （根据要求变动）
#define APP_MAIN_COLOR  [UIColor colorWithRed:218/255.0f green:37/255.0f blue:29/255.0f alpha:1.0]

/** 字符串是否为空*/
#define IsStrEmpty(_ref)             (([(_ref) isKindOfClass:[NSNull class]]) || ((_ref) == nil) || ([(_ref)isEqualToString:@""] || [(_ref)isEqualToString:@"(null)"] || [(_ref)isEqualToString:@"<null>"]))
/** 判断字典是否为空*/
#define IsDictEmpty(_ref)            (([(_ref) isKindOfClass:[NSNull class]]) || ((_ref) == nil) || ((_ref) == NULL))
/** 获取RGB颜色 */
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

//MARK: - 屏幕适配

//状态栏高度
#define STATUSBAR_HEIGHT  [[UIApplication sharedApplication] statusBarFrame].size.height
//屏幕物理宽度
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
//屏幕物理高度
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
//导航栏高度
#define NAVBAR_SUM_HEIGHT  ((IS_IPHONE_X == YES || IS_IPHONE_XR == YES || IS_IPHONE_XS_MAX == YES) ?88:64)
//适配iPhoneX 的高度
#define X_Height(h) ((IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XS_MAX) ? (h+24):h)
//适配iPhoneX 底部
#define X_Bottom(h) ((IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XS_MAX) ? (h+34):h)

//MARK: - 判断 iPhone 机型
#define IS_IPHONE_4 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)480) < DBL_EPSILON)
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE_XS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

// iOS版本
#define iOS11Later ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)
#define iOS10Later ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f)

//打印
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%sLine%d]\n\n\t" fmt "\n\n"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#define DLogLite(...) NSLog((@"%s [Line %d] %@"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(fmt, ...)

#define DLogLite(...)
#endif


//MARK: - 判断网络状态
#define HasNetwork  [[NSUserDefaults standardUserDefaults] boolForKey:@"reachability"]

//MARK: - 区分真机和模拟器
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

#endif /* BaseMacro_h */
