//
//  XWMediator.h
//  TaiZhouEPApp
//
//  Created by apple on 2019/11/30.
//  Copyright © 2019 snew. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XWNewsDetailViewControllerProtocol <NSObject>

- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end

typedef void(^XWMediatorProcessBlock)(NSDictionary *params);

@interface XWMediator : NSObject

//target action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

//URL Scheme
+ (void)registerScheme:(NSString *)scheme progressBlock:(XWMediatorProcessBlock)progressBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

//protocol
+ (void)registerProtol:(Protocol *)proto class:(Class)cls;
+ (Class)classForProtocol:(Protocol *)proto;

@end

NS_ASSUME_NONNULL_END
