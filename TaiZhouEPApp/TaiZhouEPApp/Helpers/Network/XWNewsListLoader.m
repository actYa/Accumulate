//
//  XWNewsListLoader.m
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/11/27.
//  Copyright © 2019 snew. All rights reserved.
//

#import "XWNewsListLoader.h"
#import "XWListItem.h"
#import "XWNetworkManager.h"

@implementation XWNewsListLoader

- (void)loadListDataWithFinishBlock:(XWListLoaderFinishBlock)finishBlock {
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    
    [XWNetworkManager requestWithMethods:GET UrlString:urlString Params:nil Success:^(id  _Nonnull jsonObj) {
        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = [NSMutableArray arrayWithCapacity:dataArray.count];
               for (NSDictionary *info in dataArray) {
                   XWListItem *listItem = [[XWListItem alloc] init];
                   [listItem initWithDictionary:info];
                   [listItemArray addObject:listItem];
               }
               dispatch_async(dispatch_get_main_queue(), ^{
                   if (finishBlock) {
                       finishBlock(YES, listItemArray.copy);
                   }
               });
        
    } Failure:^(id  _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
   
}

/*
- (void)loadListDataWithFinishBlock:(XWListLoaderFinishBlock)finishBlock {
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *listURL = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sharedSession];
//     __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//         __strong typeof(weakSelf) strongSelf = weakSelf;
        NSError *jsonErr;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonErr];
        NSArray *dataArray =  [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            XWListItem *listItem = [[XWListItem alloc] init];
            [listItem initWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
    }];
    [dataTask resume]; //开启
    
}
*/
@end
