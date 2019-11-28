//
//  XWNetworkManager.m
//  TaiZhouEPApp
//
//  Created by apple on 2019/11/28.
//  Copyright © 2019 snew. All rights reserved.
//

#import "XWNetworkManager.h"
#import <AFHTTPSessionManager.h>

static AFHTTPSessionManager *_manager;

@implementation XWNetworkManager

+ (AFHTTPSessionManager *)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [AFHTTPSessionManager manager];
    });
    return _manager;
}


+ (void)requestWithMethods:(RequestMethod)methods UrlString:(NSString *)urlString Params:(id)params Success:(void (^)(id _Nonnull))success Failure:(void (^)(id _Nonnull))failure {
    //获取AF网络请求对象
    [self sharedManager];
    
    if (methods == GET) {
        [_manager GET:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            //加载进度
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
    }else if (methods == POST) {
        [_manager POST:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            //加载进度
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
    }
}

@end
