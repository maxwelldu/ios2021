//
//  GTCommentManager.h
//  SampleApp
//
//  Created by QTT on 2021/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTCommentManager : NSObject
+(GTCommentManager *)sharedManager;
-(void)showCommentView;
@end


NS_ASSUME_NONNULL_END
