//
//  XWMediator.m
//  TaiZhouEPApp
//
//  Created by apple on 2019/11/30.
//  Copyright © 2019 snew. All rights reserved.
//

#import "XWMediator.h"

@implementation XWMediator

+ (UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl {
    Class cls = NSClassFromString(@"XWNewsDetailViewController");
    //tips_1 👇关于此处，在最下面有相关解释
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    UIViewController *detailVC = [[cls alloc] performSelector:NSSelectorFromString(@"initWithArticleUrl:") withObject:detailUrl];
#pragma clang diagnostic pop
    return detailVC;
}

+ (NSMutableDictionary *)mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [NSMutableDictionary dictionary];
    });
    return cache;
}

+ (void)registerScheme:(NSString *)scheme progressBlock:(XWMediatorProcessBlock)progressBlock {
    if (scheme && progressBlock) {
        [[self mediatorCache] setObject:progressBlock forKey:scheme];
    }
}

+ (void)openUrl:(NSString *)url params:(NSDictionary *)params {
    XWMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

+ (void)registerProtol:(Protocol *)proto class:(Class)cls {
    if (proto && cls) {
        [[self mediatorCache] setObject:cls forKey: NSStringFromProtocol(proto)];
    }
}

+ (Class)classForProtocol:(Protocol *)proto {
    return  [[self mediatorCache] objectForKey:NSStringFromProtocol(proto)];
}




@end

/*
 tips_1 👆
首先#pragma在本质上是声明，常用的功能就是注释，尤其是给Code分段注释；而且它还有另一个强大的功能是处理编译器警告，但却没有上一个功能用的那么多。
clang diagnostic 是#pragma 第一个常用命令：

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-相关命令"
    // 你自己的代码
#pragma clang diagnostic pop
 相关网站
 http://nshipster.cn/pragma/
 http://nshipster.com/clang-diagnostics/
 http://fuckingclangwarnings.com/
 */
