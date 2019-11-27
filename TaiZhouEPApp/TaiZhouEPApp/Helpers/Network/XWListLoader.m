//
//  XWListLoader.m
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/11/27.
//  Copyright © 2019 snew. All rights reserved.
//

#import "XWListLoader.h"

@implementation XWListLoader

- (void)loadListDataWithFinishBlock:(XWListLoaderFinishBlock)finishBlock {
    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
    NSURL *listURL = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonErr;
        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonErr];
        DLog(@"%@",jsonData);
    }];
    [dataTask resume]; //开启
    
}

@end
