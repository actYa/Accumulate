//
//  XWNewsTableViewCell.h
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/11/27.
//  Copyright © 2019 snew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class XWListItem;

@interface XWNewsTableViewCell : UITableViewCell

- (void)layoutTableViewCellWithItem:(XWListItem *)item;

@end

NS_ASSUME_NONNULL_END
