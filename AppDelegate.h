//
//  AppDelegate.h
//  TabbarViewController


#import <UIKit/UIKit.h>
@class SWRevealViewController;


#import "ViewController.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
#import "SeventhViewController.h"
#import "SWRevealViewController.h"
#import "UserProfileViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,SWRevealViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) ViewController *objFirstViewController;
@property (strong, nonatomic) SecondViewController *objSecondViewController;
@property (strong, nonatomic) ThirdViewController *objThirdViewController;
@property (strong, nonatomic) FourthViewController *objFourthViewController;
@property (strong, nonatomic) FifthViewController *objFifthViewController;
@property (strong, nonatomic) SixthViewController *objSixthViewController;
@property (strong, nonatomic) SeventhViewController *objSeventhViewController;
@property (strong, nonatomic) UserProfileViewController *objUserProfileViewController;

@property (strong, nonatomic) UINavigationController *firstNavigationController;
@property (strong, nonatomic) UINavigationController *secondNavigationController;
@property (strong, nonatomic) UINavigationController *thirdNavigationController;
@property (strong, nonatomic) UINavigationController *fourthNavigationController;
@property (strong, nonatomic) UINavigationController *fifthNavigationController;
@property (strong, nonatomic) UINavigationController *sixthNavigationController;
@property (strong, nonatomic) UINavigationController *seventhNavigationController;
@property (strong, nonatomic) UINavigationController *userProfileNavigationController;

@property (strong, nonatomic) SWRevealViewController *viewController;


@end

