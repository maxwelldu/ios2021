//
//  GTLogin.h
//  SampleApp
//
//  Created by QTT on 2021/10/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTLoginFinishBlock)(BOOL isLogin);

/// QQ登录和分享相关逻辑
@interface GTLogin : NSObject


/// 正常要生成一个Model，这里为了方便，临时使用三个属性
@property(nonatomic, strong, readwrite) NSString *nick;
@property(nonatomic, strong, readwrite) NSString *address;
@property(nonatomic, strong, readwrite) NSString *avatarUrl;

+ (instancetype)sharedLogin;

#pragma mark - 登录
- (BOOL)isLogin;
- (void)loginWithFinishBlock:(GTLoginFinishBlock)finishBlock;
- (void)logout;

#pragma mark - 分享
- (void)shareToQQWithArticleUrl:(NSURL *)articleUrl;

@end

NS_ASSUME_NONNULL_END
