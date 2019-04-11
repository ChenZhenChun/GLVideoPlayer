//
//  GLPlayerView.h
//  AiyoyouDemo
//
//  Created by gulu on 2017/12/28.
//  Copyright © 2017年 aiyoyou. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GLPlayerView : UIImageView
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) NSURL *url;
@property (nonatomic,copy) NSString *cover;//可以是本地图片也可以是网络图片
@property (nonatomic,readonly) UIButton *videoPlayView;
- (void)playVideo;
@end
