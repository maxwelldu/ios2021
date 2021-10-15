//
//  GTVideoCoverView.m
//  SampleApp
//
//  Created by QTT on 2021/10/15.
//

#import "GTVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>

@interface GTVideoCoverView()

@property(nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property(nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property(nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;

@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, copy, readwrite) NSString *videoUrl;

@end

@implementation GTVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,frame.size.width, frame.size.height)];
            _coverView;
        })];
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2, (frame.size.height-50)/2,50, 50)];
            _playButton.image = [UIImage imageNamed:@"videoPlay"];
            
            _playButton;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
        
        // 向整个通知中心注册一个中心化管理，生命周期是整个的生命周期
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - public method
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    //真实情况是取第一帧的
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
}

#pragma mark - private method
- (void)_tapToPlay {
    // 一些细的资源，可以详细的处理；如果不需要精细化控制，可以直接生成一个AVPlayer
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
//    AVPlayer *avPlayer = [AVPlayer playerWithURL:videoURL];
    
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:_playerLayer];
    
    [_avPlayer play];
}

// 播放完成后将播放器移除
- (void)_handlePlayEnd{
    [_playerLayer removeFromSuperlayer];
    _videoItem = nil;
    _avPlayer = nil;
    NSLog(@"");
}

@end
