//
//  XWVideoToolbar.h
//  TaiZhouEPApp
//
//  Created by apple on 2019/12/6.
//  Copyright © 2019 snew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define XWVideoToolbarHeight UI(60)

/**
 视频ViewController Item下的Toolbar
 */
@interface XWVideoToolbar : UIView

/**
 根据数据布局Toolbar
 */
- (void)layoutWithModel:(id)model;


@end

NS_ASSUME_NONNULL_END
