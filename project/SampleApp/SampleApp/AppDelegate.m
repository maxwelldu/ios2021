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
    [[GTFrameworkClass alloc] init];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"did select");
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return YES;
}
@end
