//
//  AppDelegate.m
//  SampleApp
//
//  Created by QTT on 2021/10/13.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];


    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    ViewController *vc = [[ViewController alloc] init];
    
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    
    navC.tabBarItem.title = @"新闻";
    navC.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
    navC.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor yellowColor];
    vc2.tabBarItem.title = @"视频";
    vc2.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor greenColor];
    vc3.tabBarItem.title = @"推荐";
    vc3.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor =[ UIColor lightGrayColor];
    vc4.tabBarItem.title = @"我的";
    vc4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    
    [tabbarController setViewControllers:@[navC, vc2, vc3, vc4]];
    
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
