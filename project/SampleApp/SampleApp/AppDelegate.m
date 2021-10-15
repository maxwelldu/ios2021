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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];


    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    tabbarController.delegate = self;
    
    GTNewsViewController *newsViewController = [[GTNewsViewController alloc] init];
    newsViewController.tabBarItem.title = @"新闻";
    newsViewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
    newsViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    
    GTVideoViewController *videoViewController = [[GTVideoViewController alloc] init];
   
    
    GTRecommendViewController *vc3 = [[GTRecommendViewController alloc] init];

    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor =[ UIColor lightGrayColor];
    vc4.tabBarItem.title = @"我的";
    vc4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    
    [tabbarController setViewControllers:@[newsViewController, videoViewController, vc3, vc4]];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:({
        GTSplashView *splashView = [[GTSplashView alloc] initWithFrame:self.window.bounds];
        splashView;
    })];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"did select");
}

@end
