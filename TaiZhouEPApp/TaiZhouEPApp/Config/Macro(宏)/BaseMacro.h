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
//屏幕尺寸及适配
#import "XWScreenAdaptation.h"

//app主色调 （根据要求变动）
#define APP_MAIN_COLOR  [UIColor colorWithRed:218/255.0f green:37/255.0f blue:29/255.0f alpha:1.0]

/** 字符串是否为空*/
#define IsStrEmpty(_ref)             (([(_ref) isKindOfClass:[NSNull class]]) || ((_ref) == nil) || ([(_ref)isEqualToString:@""] || [(_ref)isEqualToString:@"(null)"] || [(_ref)isEqualToString:@"<null>"]))
/** 判断字典是否为空*/
#define IsDictEmpty(_ref)            (([(_ref) isKindOfClass:[NSNull class]]) || ((_ref) == nil) || ((_ref) == NULL))
/** 获取RGB颜色 */
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

// iOS版本
#define iOS13Later ([UIDevice currentDevice].systemVersion.floatValue >= 13.0f)
#define iOS11Later ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)
#define iOS10Later ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f)

//MARK: - 日志打印
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
