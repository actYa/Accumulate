//
//  XWVideoListCoverView.h
//  TaiZhouEPApp
//
//  Created by apple on 2019/12/6.
//  Copyright © 2019 snew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XWVideoListCoverView : UICollectionViewCell

/**
 根据数据布局，封面图&播放 url
 */
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
