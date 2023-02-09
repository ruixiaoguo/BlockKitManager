//
//  AppDelegate.m
//  BlockKitManager
//
//  Created by GRX on 2023/2/9.
//

#import "AppDelegate.h"
#import "RootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    RootViewController *rootVC = [[RootViewController alloc]init];
    self.window.rootViewController = [UINavigationController rootVC:rootVC];
    return YES;
}


@end
