//
//  XWNetworkManager.h
//  TaiZhouEPApp
//
//  Created by apple on 2019/11/28.
//  Copyright © 2019 snew. All rights reserved.
//

#import <Foundation/Foundation.h>

//网络请求基础类
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, RequestMethod) {
    GET,
    POST,
};

@interface XWNetworkManager : NSObject


//基础网络请求对象方法
+ (void)requestWithMethods:(RequestMethod)methods UrlString:(NSString *)urlString Params:(_Nullable id)params Success:(void (^)(id jsonObj))success Failure:(void (^)(id error))failure;

@end

NS_ASSUME_NONNULL_END
