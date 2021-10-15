//
//  GTVideoPlayer.m
//  SampleApp
//
//  Created by QTT on 2021/10/15.
//

#import "GTVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface GTVideoPlayer()
@property(nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property(nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property(nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;
@end

@implementation GTVideoPlayer
+ (GTVideoPlayer *)player {
    static GTVideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[GTVideoPlayer alloc] init];
    });
    return player;
}

- (void)playVideoWithVideoUrl:(NSString *)videoUrl attachView:(UIView *)attachView {
    // 为了保证全局只有一个播放器，每次先删除之前存在的播放器，再创建新的
    [self _stopPlay];
    
    // 一些细的资源，可以详细的处理；如果不需要精细化控制，可以直接生成一个AVPlayer
    NSURL *videoURL = [NSURL URLWithString:videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    // KVO 对属性的监听
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    CMTime duration = _videoItem.duration;
    CGFloat videoDuration = CMTimeGetSeconds(duration);
    
    
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度 %f", CMTimeGetSeconds(time));
    }];

    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:_playerLayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
}

- (void)_stopPlay {
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    [_playerLayer removeFromSuperlayer];
    
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    
    _videoItem = nil;
    _avPlayer = nil;
}

// 播放完成后将播放器移除
- (void)_handlePlayEnd{
    [_avPlayer seekToTime:CMTimeMake(0, 1)];
    [_avPlayer play];
    NSLog(@"");
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString: @"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            [_avPlayer play];
        } else {
            // 资源加载失败可以处理错误，url的错误，网络的错误等
            NSLog(@"");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSLog(@"缓冲 %@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}
@end
