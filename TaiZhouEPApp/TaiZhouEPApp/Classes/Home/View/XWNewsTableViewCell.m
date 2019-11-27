//
//  XWNewsTableViewCell.m
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/11/27.
//  Copyright © 2019 snew. All rights reserved.
//

#import "XWNewsTableViewCell.h"
#import "XWListItem.h"

@interface XWNewsTableViewCell ()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *sourceLabel;
@property (nonatomic,strong) UILabel *commentLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIImageView *rightImageView;

@end

@implementation XWNewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellUI];
    }
    return self;
}

- (void)setupCellUI {
    [self.contentView addSubview:({
        self.rightImageView = [[UIImageView alloc] init];
//        self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.rightImageView;
    })];
    
    [self.contentView addSubview:({
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:16.0];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.titleLabel;
    })];
    
    [self.contentView addSubview:({
        self.sourceLabel = [[UILabel alloc] init];
        self.sourceLabel.font = [UIFont systemFontOfSize:12.0];
        self.sourceLabel.textColor = [UIColor grayColor];
        self.sourceLabel;
    })];
    
    [self.contentView addSubview:({
        self.commentLabel = [[UILabel alloc] init];
        self.commentLabel.font = [UIFont systemFontOfSize:12.0];
        self.commentLabel.textColor = [UIColor grayColor];
        self.commentLabel;
    })];
    
    [self.contentView addSubview:({
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:12.0];
        self.timeLabel.textColor = [UIColor grayColor];
        self.timeLabel;
    })];
    
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.width.equalTo(@100);
        make.height.equalTo(@70);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.contentView).offset(12);
        make.right.equalTo(self.rightImageView.mas_left).offset(-8);
    }];
    
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.bottom.equalTo(self.rightImageView);
    }];
    
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sourceLabel.mas_right).offset(8);
        make.bottom.equalTo(self.rightImageView);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.commentLabel.mas_right).offset(8);
        make.bottom.equalTo(self.rightImageView);
    }];
    
}

- (void)layoutTableViewCellWithItem:(XWListItem *)item {
    self.titleLabel.text = item.title;
    self.sourceLabel.text = item.authorName;
    self.commentLabel.text = item.category;
    self.timeLabel.text = item.date;
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:item.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];

}

@end
