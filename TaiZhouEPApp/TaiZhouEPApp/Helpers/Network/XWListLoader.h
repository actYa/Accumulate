//
//  XWListLoader.h
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/11/27.
//  Copyright © 2019 snew. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^XWListLoaderFinishBlock)(BOOL success,NSArray *dataArray);

@interface XWListLoader : NSObject

- (void)loadListDataWithFinishBlock:(XWListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
