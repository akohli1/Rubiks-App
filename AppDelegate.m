//
//  AppDelegate.m
//  TabbarViewController




#import "AppDelegate.h"
#import "SWRevealViewController.h"
#import "MenuViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize tabBarController = _tabBarController;
@synthesize objFirstViewController = _objFirstViewController;
@synthesize objSecondViewController = _objSecondViewController;
@synthesize objThirdViewController = _objThirdViewController;
@synthesize objFourthViewController = _objFourthViewController;
@synthesize objFifthViewController = _objFifthViewController;
@synthesize objSixthViewController = _objSixthViewController;
@synthesize objSeventhViewController = _objSeventhViewController;
@synthesize firstNavigationController = _firstNavigationController;
@synthesize secondNavigationController = _secondNavigationController;
@synthesize thirdNavigationController = _thirdNavigationController;
@synthesize fourthNavigationController = _fourthNavigationController;
@synthesize fifthNavigationController = _fifthNavigationController;
@synthesize sixthNavigationController = _sixthNavigationController;
@synthesize seventhNavigationController = _seventhNavigationController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor clearColor];
    
   
   
    _objFirstViewController = [[ViewController alloc] init];
    self.objFirstViewController.title = @"Questions";
    self.objFirstViewController.tabBarItem.image = [UIImage imageNamed:@"tab1.png"];
    
    _objSecondViewController = [[SecondViewController alloc] init];
    self.objSecondViewController.title = @"Tags";
    self.objSecondViewController.tabBarItem.image = [UIImage imageNamed:@"tab2.png"];
    
    _objThirdViewController = [[ThirdViewController alloc] init];
    self.objThirdViewController.tabBarItem.title = @"Users";
    self.objThirdViewController.tabBarItem.image = [UIImage imageNamed:@"tab3.png"];
    
    _objFourthViewController  = [[FourthViewController alloc] init];
    self.objFourthViewController.tabBarItem.title = @"Badges";
    self.objFourthViewController.tabBarItem.image = [UIImage imageNamed:@"tab4.png"];
    
    _objFifthViewController = [[FifthViewController alloc] init];
    self.objFifthViewController.tabBarItem.title = @"Unanswered";
    self.objFifthViewController.tabBarItem.image = [UIImage imageNamed:@"tab5.png"];
    
    _objSixthViewController = [[SixthViewController alloc] init];
    self.objSixthViewController.tabBarItem.title = @"Logout";
    self.objSixthViewController.tabBarItem.image = [UIImage imageNamed:@"tab6.png"];
    
    
    _objSeventhViewController = [[SeventhViewController alloc]init];
    self.objSeventhViewController.title = @"Can Add More";
    self.objSeventhViewController.tabBarItem.image = [UIImage imageNamed:@"tab1.png"];
    
    _firstNavigationController = [[UINavigationController alloc] initWithRootViewController:self.objFirstViewController];
    _secondNavigationController = [[UINavigationController alloc] initWithRootViewController:self.objSecondViewController];
    _thirdNavigationController = [[UINavigationController alloc] initWithRootViewController:self.objThirdViewController];
    _fourthNavigationController = [[UINavigationController alloc] initWithRootViewController:self.objFourthViewController];
   _fifthNavigationController = [[UINavigationController alloc] initWithRootViewController:self.objFifthViewController];
   _sixthNavigationController = [[UINavigationController alloc] initWithRootViewController:self.objSixthViewController];
    _seventhNavigationController = [[UINavigationController alloc]initWithRootViewController:self.objSeventhViewController];
    
    _tabBarController = [[UITabBarController alloc] init];
    NSArray *viewControllersArray = [NSArray arrayWithObjects:self.firstNavigationController,self.secondNavigationController,self.thirdNavigationController,self.fourthNavigationController,self.fifthNavigationController,self.sixthNavigationController,self.seventhNavigationController, nil];
    [self.tabBarController setViewControllers:viewControllersArray];
    
    
    MenuViewController *rearViewController = [[MenuViewController alloc] init];
    UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:rearViewController];
    
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:self.tabBarController];
    
    revealController.delegate = self;
    
    self.viewController = revealController;
    
    self.window.rootViewController = self.viewController;
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];

    
    [self.window makeKeyAndVisible];
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
