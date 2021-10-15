//
//  GTVideoPlayer.h
//  SampleApp
//
//  Created by QTT on 2021/10/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoPlayer : NSObject
+ (GTVideoPlayer *)player;
- (void)playVideoWithVideoUrl:(NSString *)videoUrl attachView:(UIView *)attachView;
@end

NS_ASSUME_NONNULL_END
