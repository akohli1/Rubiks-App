//
//  SixthViewController.m
//  TabBarController
//

//

#import "SixthViewController.h"
#import "SWRevealViewController.h"

@interface SixthViewController ()

@end

@implementation SixthViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
 self.view.backgroundColor = [UIColor colorWithRed:224.0f/255 green:224.0f/255 blue:224.0f/255 alpha:1.0];
    
    self.navigationItem.title = @"Logout";

//    SWRevealViewController *revealController = [self revealViewController];
//    
//    [revealController panGestureRecognizer];
//    [revealController tapGestureRecognizer];
//    //Add an image to your project & set that image here.
//    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
//    UIView *lBtnView = [[UIView alloc] initWithFrame:CGRectMake(-20, 0, 100, 40)];
//    UIButton *lBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [lBtn setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
//   // [lBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
//    [lBtn setFrame:CGRectMake(10, 10, 20, 15)];
//    
//    [lBtnView addSubview:lBtn];
  //  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:lBtnView];

    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
