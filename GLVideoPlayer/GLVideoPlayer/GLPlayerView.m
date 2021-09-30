//
//  GLPlayerView.m
//  AiyoyouDemo
//
//  Created by gulu on 2017/12/28.
//  Copyright © 2017年 aiyoyou. All rights reserved.
//

#import "GLPlayerView.h"
#import "JPVideoPlayerKit.h"
#import "UIImageView+WebCache.h"

@interface GLPlayerView() <JPVideoPlayerDelegate>
@property (nonatomic,strong) UIButton                   *videoPlayView;
@end

@implementation GLPlayerView

#pragma mark - 播放器view初始化
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (!CGRectIsEmpty(frame)) {
        [self setup];
    }
}

- (void)setup {
    self.backgroundColor = [UIColor blackColor];
    self.videoPlayView.jp_videoPlayerDelegate = self;
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.userInteractionEnabled = YES;
    [self addSubview:self.videoPlayView];
}

- (void)playVideo {
    if (!_url) return;
    [self.videoPlayView jp_playVideoWithURL:_url
                         bufferingIndicator:nil
                                controlView:nil
                               progressView:nil
                              configuration:^(UIView *view, JPVideoPlayerModel *playerModel) {
                                  
                              }];
}


#pragma mark - JPVideoPlayerDelegate

- (BOOL)shouldShowBlackBackgroundWhenPlaybackStart {
    if (self.videoPlayView.jp_viewInterfaceOrientation == JPVideoPlayViewInterfaceOrientationLandscape) {
        return YES;
    }
    return NO;
}

#pragma mark - Properties

- (void)setCover:(NSString *)cover {
    _cover = cover;
    if (_cover&&[_cover containsString:@"/"]) {
        [self sd_setImageWithURL:[NSURL URLWithString:_cover] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates|SDWebImageLowPriority];
    }else {
        self.image = [UIImage imageNamed:_cover];
    }
}

- (UIButton *)videoPlayView {
    if (_videoPlayView) return _videoPlayView;
    _videoPlayView = [UIButton buttonWithType:UIButtonTypeCustom];
    _videoPlayView.backgroundColor = [UIColor clearColor];
    _videoPlayView.frame = self.bounds;
    [_videoPlayView setImage:[UIImage imageNamed:@"playIcon_video"] forState:UIControlStateNormal];
    [_videoPlayView addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    return _videoPlayView;
}

@end
