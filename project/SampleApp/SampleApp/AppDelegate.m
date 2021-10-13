//
//  AppDelegate.m
//  SampleApp
//
//  Created by QTT on 2021/10/13.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor =[ UIColor lightGrayColor];
    
    [tabbarController setViewControllers:@[vc1, vc2, vc3, vc4]];
    
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
