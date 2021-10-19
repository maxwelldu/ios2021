//
//  AppDelegate.m
//  SampleApp
//
//  Created by QTT on 2021/10/13.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
#import "GTSplashView.h"
#import "GTStaticTest.h"
#import <GTFramework/GTFrameworkClass.h>
#import "GTMineViewController.h"
#import <execinfo.h>
#import "GTLocation.h"
#import "GTNotification.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];


    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    tabbarController.delegate = self;
    
    GTNewsViewController *newsViewController = [[GTNewsViewController alloc] init];
    GTVideoViewController *videoViewController = [[GTVideoViewController alloc] init];
    GTRecommendViewController *recommendVC = [[GTRecommendViewController alloc] init];
    GTMineViewController *mineVC = [[GTMineViewController alloc] init];
   
    [tabbarController setViewControllers:@[newsViewController, videoViewController, recommendVC, mineVC]];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:({
        GTSplashView *splashView = [[GTSplashView alloc] initWithFrame:self.window.bounds];
        splashView;
    })];
    
    // static
//    [[GTStaticTest alloc] init];
    
    //framework
//    [[GTFrameworkClass alloc] init];
    
    [self _caughtException];
//    [@[].mutableCopy addObject:nil]; //make a crash
    
    [[GTLocation locationManager] checkLocationAuthorization];
    [[GTNotification notificationManager] checkNotificationAuthorization];
    
    // 手动设置badge
    // 实际操作点击之后，-1
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"did select");
}

#pragma mark -

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //GTNotification中实现；都收敛到对应的业务模块当中
    NSLog(@"");
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"");
}

#pragma mark -

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return YES;
}

#pragma mark - crash
-(void)_caughtException {
    //NSException
    NSSetUncaughtExceptionHandler(HandleNSException);
    
    //signal
    signal(SIGABRT, SignalExceptionHandler);
    signal(SIGILL, SignalExceptionHandler);
    signal(SIGSEGV, SignalExceptionHandler);
    signal(SIGFPE, SignalExceptionHandler);
    signal(SIGBUS, SignalExceptionHandler);
    signal(SIGPIPE, SignalExceptionHandler);
}
void SignalExceptionHandler(int signal) {
    void* callstack[128];
    int frames = backtrace(callstack, 128);
    char **strs = backtrace_symbols(callstack, frames);
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    for(int i=0;i<frames;i++) {
        [backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
    }
    free(strs);
}
void HandleNSException(NSException *exception) {
    __unused NSString *reason = [exception reason];
    __unused NSString *name= [exception name];
    //存储Crash信息
}
@end
