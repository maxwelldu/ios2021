//
//  GTLogin.m
//  SampleApp
//
//  Created by QTT on 2021/10/18.
//

//真实使用的时候，将所有的注释都打开即可
#import "GTLogin.h"
//#import <TencentOpenAPI/QQApiInterface.h>
//#import <TencentOpenAPI/TencentOAuth.h>

//@interface GTLogin()<TencentSessionDelegate>
@interface GTLogin()
//@property(nonatomic,strong, readwrite)TencentOAuth *oauth;
@property(nonatomic,copy,readwrite)GTLoginFinishBlock finishBlock;
@property(nonatomic,assign,readwrite)BOOL isLogin;
@end

@implementation GTLogin

+(instancetype)sharedLogin {
    static GTLogin *login;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        login = [[GTLogin alloc] init];
    });
    return login;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        _isLogin = NO;
//        _oauth = [[TencentOAuth alloc] initWithAppId:@"222222" andDelegate:self];
    }
    return self;
}

- (BOOL)isLogin {
    //登录态失效的逻辑
    return _isLogin;
}

- (void)loginWithFinishBlock:(GTLoginFinishBlock)finishBlock {
    _finishBlock = [finishBlock copy];
    
//    _oauth.authMode = kAuthModeClientSideToken;
//    [_oauth authorize:@[kOPEN_PERMISSION_GET_USER_INFO,
//    kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
//    kOPEN_PERMISSION_ADD_ALBUM]];
}

-(void)logout {
//    [_oauth logout:self];
    _isLogin = NO;
}

#pragma mark - delegate
-(void)tencentDidLogin {
    _isLogin = YES;
//    [_oauth getUserInfo];
}

- (void)tencentDidNotLogin:(BOOL)cancelled{
    if(_finishBlock) {
        _finishBlock(NO);
    }
}
-(void)tencentDidNotNetWork {
    NSLog(@"");
}
//- (void)getUserInfoResponse:(APIResponse *)response {
//    NSDictionary *userInfo = response.jsonResponse;
//    _nick = userInfo[@"nickname"];
//    _address = userInfo[@"city"];
//    _avatarUrl = userInfo[@"figureurl_qq_2"];
//    if (_finishBlock) {
//        _finishBlock(YES);
//    }
//}

#pragma mark -
-(void)shareToQQWithArticleUrl:(NSURL *)articleUrl {
    // 登录校验
//    loginWithFinishBlock
    
//    QQApiNewsObject *newsObj = [QQApiNewsObject objectWithUrl:articleUrl title:@"10" description:@"", previewImageUrl:nil];
//    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];
//    QQApiSendResultCode sent = [QQApiInterface SendReqToQZone:req];
}

@end
