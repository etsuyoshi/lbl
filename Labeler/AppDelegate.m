//
//  AppDelegate.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/19.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "AppDelegate.h"


#import "MMDrawerController.h"
//#import "MMCenterViewController.h"
//#import "MMLeftSideDrawerViewController.h"
//#import "MMRightSideDrawerViewController.h"
#import "MMDrawerVisualState.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "MMNavigationController.h"




@interface AppDelegate ()
@property (nonatomic,strong) MMDrawerController * drawerController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //navigationcontrollerの場合
//    ViewController * rootController = [[ViewController alloc] init];
//    self.navigationController = [[UINavigationController alloc] initWithRootViewController:rootController];
//    
//    // IB使わない場合は必要な処理
//    CGRect frameForWindow = [[UIScreen mainScreen] bounds];
//    NSLog(@"frame = %@", NSStringFromCGRect(frameForWindow));
//    _window = [[UIWindow alloc] initWithFrame:frameForWindow];
//    [_window makeKeyAndVisible];
//    [_window addSubview:self.navigationController.view];
    
    //mmDrawerControllerで実行する場合
    UIViewController * leftSideDrawerViewController =
    [[LeftViewController alloc]init];
//    [[MMLeftSideDrawerViewController alloc] init];
    
    UIViewController * centerViewController =
    [[ViewController alloc]init];
//    [[MMCenterViewController alloc] init];
    
    UIViewController * rightSideDrawerViewController =
    [[RightViewController alloc] init];
//    [[MMRightSideDrawerViewController alloc] init];
    
    UINavigationController * navigationController =
    [[MMNavigationController alloc]
     initWithRootViewController:centerViewController];
    [navigationController
     setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
    if(OSVersionIsAtLeastiOS7()){
        UINavigationController * rightSideNavController =
        [[MMNavigationController alloc] initWithRootViewController:rightSideDrawerViewController];
        [rightSideNavController
         setRestorationIdentifier:@"MMExampleRightNavigationControllerRestorationKey"];
        UINavigationController * leftSideNavController =
        [[MMNavigationController alloc] initWithRootViewController:leftSideDrawerViewController];
        [leftSideNavController
         setRestorationIdentifier:@"MMExampleLeftNavigationControllerRestorationKey"];
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 leftDrawerViewController:leftSideNavController
                                 rightDrawerViewController:rightSideNavController];
        [self.drawerController setShowsShadow:NO];
    }
    else{
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 leftDrawerViewController:leftSideDrawerViewController
                                 rightDrawerViewController:rightSideDrawerViewController];
    }
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    //画面横幅に対して9掛け
    [self.drawerController setMaximumRightDrawerWidth:
     [UIScreen mainScreen].bounds.size.width*RIGHT_SIDE_VIEW_WIDTH_RATIO];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if(OSVersionIsAtLeastiOS7()){
        UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                              green:173.0/255.0
                                               blue:234.0/255.0
                                              alpha:1.0];
        [self.window setTintColor:tintColor];
    }
    [self.window setRootViewController:self.drawerController];
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
