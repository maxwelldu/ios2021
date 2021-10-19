//
//  GTNotification.h
//  SampleApp
//
//  Created by QTT on 2021/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// App 推送管理
@interface GTNotification : NSObject
+(GTNotification *)notificationManager;
-(void)checkNotificationAuthorization;
@end

NS_ASSUME_NONNULL_END
