//
//  XWVideoListCoverView.m
//  TaiZhouEPApp
//
//  Created by apple on 2019/12/6.
//  Copyright © 2019 snew. All rights reserved.
//

#import "XWVideoListCoverView.h"
#import "XWVideoToolbar.h"
#import "XWVideoPlayer.h"

@interface XWVideoListCoverView ()
@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;
@property (nonatomic, strong, readwrite) XWVideoToolbar *toolbar;
@end

@implementation XWVideoListCoverView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
                _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - XWVideoToolbarHeight)];
                _coverView;
            })];

            [_coverView addSubview:({
                _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - UI(50)) / 2, (frame.size.height - XWVideoToolbarHeight - UI(50)) / 2, UI(50), UI(50))];
                _playButton.image = [UIImage imageNamed:@"videoPlay"];
                _playButton;
            })];

            [self addSubview:({
                _toolbar = [[XWVideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, XWVideoToolbarHeight)];
                _toolbar;
            })];

            //点击全部Item都支持播放
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
            [self addGestureRecognizer:tapGesture];
    }
    return self;
}

#pragma mark - public method

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
    [_toolbar layoutWithModel:nil];
}

#pragma mark - private method

- (void)_tapToPlay {
    //在当前Item上播放视频
    [[XWVideoPlayer Player] playVideoWithUrl:_videoUrl attachView:_coverView];
}

@end
