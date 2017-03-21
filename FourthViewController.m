//
//  FourthViewController.m
//  TabBarController
//



#import "FourthViewController.h"
#import "SWRevealViewController.h"

@interface FourthViewController ()
{
    UIView *badgesView;
}

@end

@implementation FourthViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   // self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.backgroundColor = [UIColor colorWithRed:224.0f/255 green:224.0f/255 blue:224.0f/255 alpha:1.0];
    self.navigationItem.title = @"Badges";
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    //Add an image to your project & set that image here.
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    UIView *lBtnView = [[UIView alloc] initWithFrame:CGRectMake(-20, 0, 100, 40)];
    UIButton *lBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lBtn setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [lBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [lBtn setFrame:CGRectMake(10, 10, 20, 15)];
    
    [lBtnView addSubview:lBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:lBtnView];
    CGRect frame = CGRectMake(5.0f, 70.0f, self.view.frame.size.width-10.0f, 50);
    
    UIView *userProfilePic = [[UIView alloc] initWithFrame:frame];
    UIImage *pic = [UIImage imageNamed:@"ProfilePic.jpg"];
    UIImageView *userPic = [[UIImageView alloc]initWithImage:pic];
    userPic.frame = CGRectMake(0, 0, 50, 50);
    [userProfilePic addSubview:userPic];
    userProfilePic.backgroundColor = [UIColor darkGrayColor];
    UILabel *userDescription = [[UILabel alloc]initWithFrame:CGRectMake(userPic.frame.size.width, 0, userProfilePic.frame.size.width-userPic.frame.size.width, 50)];
    userDescription.backgroundColor = [UIColor whiteColor];
    userDescription.text = @"User Description";
    userDescription.textColor = [UIColor blueColor];
    [userProfilePic addSubview:userDescription];
    [self.view addSubview:userProfilePic];
    UIView* lineView=[[UIView alloc]initWithFrame:CGRectMake(5, userProfilePic.frame.origin.y+userProfilePic.frame.size.height+5, self.view.frame.size.width-10, 1)];
    [lineView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:lineView];
    
    CGRect frame2 =CGRectMake(5.0f,lineView.frame.origin.y+lineView.frame.size.height+5, self.view.frame.size.width-10.0f, 500);
    UIView *userWork = [[UIView alloc]initWithFrame:frame2];
    userWork.backgroundColor = [UIColor whiteColor];
    UILabel *workLabel = [[UILabel alloc]init];
    workLabel.frame = CGRectMake(0, 0, userWork.frame.size.width, userWork.frame.size.height);
    workLabel.backgroundColor = [UIColor grayColor];
    [userWork addSubview:workLabel];
    workLabel.text = @"User Works and Achievments";
    workLabel.textColor = [UIColor blackColor];
    [self.view addSubview:userWork];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
