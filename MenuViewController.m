//
//  MenuViewController.m
//  TabbarViewController


#import "MenuViewController.h"
#import "ViewController.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
#import "SecondViewController.h"
#define IPHONESTORYBOARD @"Main"

@interface MenuViewController ()
@property (strong, nonatomic) SWRevealViewController *viewController;

@end

@implementation MenuViewController
@synthesize optionsTableVW;
@synthesize optionsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mobile_bg"]];
    self.navigationItem.title = @"Dash Board";
    
    optionsArray = [[NSMutableArray alloc] initWithObjects:@"Questions",@"Tags",@"Users",@"Badges",@"UnAnswerd",@"Logout", nil];
    
    optionsTableVW = [[UITableView alloc] initWithFrame:
                      CGRectMake(0, 0, 258, self.view.frame.size.height) style:UITableViewStylePlain];
    
    optionsTableVW.estimatedRowHeight = 40.0f;
    optionsTableVW.backgroundColor = [UIColor clearColor];
    optionsTableVW.scrollEnabled = NO;
    // [self.optionsTableVW setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.optionsTableVW];
    
    
    
    
    [optionsTableVW setHidden:NO];
    
    optionsTableVW.tag=3;
    
    
    
    optionsTableVW.delegate = self;
    optionsTableVW.dataSource = self;
    [optionsTableVW reloadData];

    
}

#pragma mark UiTableviewDelegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    return optionsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    static NSString *AutoCompleteRowIdentifier = @"AutoCompleteRowIdentifier";
    cell = [tableView dequeueReusableCellWithIdentifier:AutoCompleteRowIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AutoCompleteRowIdentifier];
    }
    cell.textLabel.font=[UIFont fontWithName:@"Abel-Regular" size:14.0f];
    
    cell.textLabel.text=[optionsArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor=[UIColor whiteColor];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];

    /*if (indexPath.row==0) {
        
    ViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    [navController setViewControllers: @[rootViewController] animated: YES];
    
    [self.revealViewController setFrontViewController:navController];
    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    }
    if (indexPath.row==1) {
        SecondViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"SecondView"];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
        [navController setViewControllers: @[rootViewController] animated: YES];
        
        [self.revealViewController setFrontViewController:navController];
        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];

    }*/
    
}


- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.backgroundColor=[UIColor colorWithRed:48.0 / 255.0 green:80.0 / 255.0 blue:80.0 / 255.0 alpha:1];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{

    
    return 40;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
