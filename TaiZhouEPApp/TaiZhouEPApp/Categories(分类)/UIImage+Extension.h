//
//  UIImage+Extension.h
//  HuRuan
//
//  Created by apple on 2019/1/30.
//  Copyright © 2019 tzw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

/**
 *  图片压缩到指定大小
 *  @param targetSize  目标图片的大小
 *  @return 目标图片
 */
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

/**
压缩图片大小

 @param maxLength 最大限度
 @return 返回nsdata数据
 */
- (NSData *)compressQualityWithMaxLength:(NSInteger)maxLength;
@end

NS_ASSUME_NONNULL_END
