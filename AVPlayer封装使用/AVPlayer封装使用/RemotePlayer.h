//
//  RemotePlayer.h
//  AVPlayer封装使用
//
//  Created by zsp on 2018/2/27.
//  Copyright © 2018年 zsp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface RemotePlayer : NSObject
/**
 根据URL地址进行播放音频
 
 @param url url
 */
- (void)playWithURL: (NSURL *)url;

/**
 暂停当前音频
 */
- (void)pause;

/**
 继续播放
 */
- (void)resume;

/**
 停止播放
 */
- (void)stop;

/**
 快速播放到某个时间点
 
 @param time 时间
 */
- (void)seekWithTime: (NSTimeInterval)time;

/**
 根据进度播放
 
 */
//- (void)seekWithProgress: (float)progress;

/**
 速率
 */
@property (nonatomic, assign) float rate;

/**
 声音
 */
@property (nonatomic, assign) float volume;

/**
 静音
 */
@property (nonatomic, assign) BOOL mute;
@property (nonatomic, assign) float progress;

@property (nonatomic, assign, readonly) double duration;
@property (nonatomic, assign, readonly) double currentTime;


@property (nonatomic, strong, readonly) NSURL *url;

@property (nonatomic, assign, readonly) float loadProgress;




@end
