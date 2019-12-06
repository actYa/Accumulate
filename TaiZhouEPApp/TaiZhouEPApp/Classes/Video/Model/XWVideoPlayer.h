//
//  XWVideoPlayer.h
//  TaiZhouEPApp
//
//  Created by apple on 2019/12/6.
//  Copyright © 2019 snew. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
播放器
*/
@interface XWVideoPlayer : NSObject

/**
 全局播放器单例
 */
+ (XWVideoPlayer *)Player;

/**
 在指定View上 通过url播放视频
 */
- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView;

@end

NS_ASSUME_NONNULL_END
