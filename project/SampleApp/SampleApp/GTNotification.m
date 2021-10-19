//
//  GTNotification.m
//  SampleApp
//
//  Created by QTT on 2021/10/19.
//

#import "GTNotification.h"
#import <UserNotifications/UserNotifications.h>

@interface GTNotification()

@end

@implementation GTNotification

+(GTNotification *)notificationManager{
    static GTNotification *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTNotification alloc] init];
    });
    return manager;
}
-(void)checkNotificationAuthorization{
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionBadge  | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"");
    }];
}
@end
