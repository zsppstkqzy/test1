//
//  RemotePlayer.m
//  AVPlayer封装使用
//
//  Created by zsp on 2018/2/27.
//  Copyright © 2018年 zsp. All rights reserved.
//

#import "RemotePlayer.h"
@interface RemotePlayer ()

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation RemotePlayer

- (void)playWithURL: (NSString *)url{
    _url = [NSURL URLWithString:url];
    if (self.player.currentItem) {
        [self clearObserver:self.player.currentItem];
    }
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:_url];
    [item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    self.player = [AVPlayer playerWithPlayerItem:item];
    
}

- (void)pause{
    [self.player pause];
}

- (void)resume{
    [self.player play];
}

- (void)stop{
    [self.player pause];
    [self clearObserver:self.player.currentItem];
    self.player = nil;
}

- (void)setRate:(float)rate {
    self.player.rate = rate;
}
- (float)rate {
    return self.player.rate;
}

- (void)setVolume:(float)volume {
    if (volume > 0) {
        [self setMute:NO];
    }
    self.player.volume = volume;
}
- (float)volume {
    return self.player.volume;
}

- (void)setMute:(BOOL)mute {
    self.player.muted = mute;
}

- (BOOL)mute {
    return self.player.isMuted;
}

- (void)seekWithTime: (NSTimeInterval)time{
    double currentTime = self.currentTime + time;
    double totalTime = self.duration;
    [self setProgress:currentTime / totalTime];
}

- (double)duration {
    double time = CMTimeGetSeconds(self.player.currentItem.duration);
    if (isnan(time)) {
        return 0;
    }
    return time;
}

- (double)currentTime {
    
    double time = CMTimeGetSeconds(self.player.currentItem.currentTime);
    
    if (isnan(time)) {
        return 0;
    }
    return time;
}

- (float)progress {
    
    if (self.duration == 0) {
        return 0;
    }
    return self.currentTime / self.duration;
}

- (void)setProgress:(float)progress {
    double totalTime = self.duration;
    double currentTimeSec = totalTime * progress;
    CMTime playTime = CMTimeMakeWithSeconds(currentTimeSec, NSEC_PER_SEC);
    
    [self.player seekToTime:playTime completionHandler:^(BOOL finished) {
        if (finished) {
            NSLog(@"确认加载这个时间节点的数据");
        }else {
            NSLog(@"取消加载这个时间节点的播放数据");
        }
    }];
}

-(float)loadProgress {
    
    CMTimeRange range = [self.player.currentItem.loadedTimeRanges.lastObject CMTimeRangeValue];
    CMTime loadTime = CMTimeAdd(range.start, range.duration);
    double loadTimeSec = CMTimeGetSeconds(loadTime);
    if (self.duration == 0) {
        return 0;
    }
    return loadTimeSec / self.duration;
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerItemStatus status = [change[NSKeyValueChangeNewKey] integerValue];
        switch (status) {
            case AVPlayerItemStatusReadyToPlay:
            {
                NSLog(@"准备完毕, 开始播放");
                [self resume];
                break;
            }
            case AVPlayerItemStatusFailed:
            {
                NSLog(@"数据准备失败, 无法播放");
                break;
            }
                
            default:
                break;
        }
    }
}

- (void)clearObserver: (AVPlayerItem *)item {
    [item removeObserver:self forKeyPath:@"status"];
}

- (void)dealloc {
    [self clearObserver:self.player.currentItem];
}

@end
