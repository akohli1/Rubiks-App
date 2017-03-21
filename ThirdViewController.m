//
//  ThirdViewController.m
//  TabBarController
//

//

#import "ThirdViewController.h"
#import "SWRevealViewController.h"
#import "UserProfileViewController.h"
#define  IPHONESTORYBOARD @"Main"
@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize optionsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.view.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor colorWithRed:224.0f/255 green:224.0f/255 blue:224.0f/255 alpha:1.0];
    self.navigationItem.title = @"Users";
    
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    //Add an image to your project & set that image here.
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    UIView *lBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    UIButton *lBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lBtn setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [lBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [lBtn setFrame:CGRectMake(10, 10, 20, 15)];
    
    [lBtnView addSubview:lBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:lBtnView];
    
   /* UIView *rBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    UIButton *rBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rBtn setTitle:@"XYZ" forState:UIControlStateNormal];
    [rBtn addTarget:self action:@selector(userProfile) forControlEvents:UIControlEventTouchUpInside];
    [rBtn.titleLabel setFont:[UIFont fontWithName:@"ChalkboardSE-Regular" size:16]];
    [rBtn setFrame:CGRectMake(30, 5, 60, 30)];
    [rBtnView addSubview:rBtn];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rBtnView];*/
    [self loadTableView];
    
}

/*-(void)userProfile{
    
    UserProfileViewController *userProfile = [[UserProfileViewController alloc]init];
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:IPHONESTORYBOARD bundle:nil];
    userProfile = [mainStoryBoard instantiateViewControllerWithIdentifier:@"AskView"];
    
    [self.navigationController pushViewController:userProfile animated:YES];
    
    
    
}*/

-(void)loadTableView {
    
    
    
    UISearchBar *search = [[UISearchBar alloc] init];
    [search setTintColor:[UIColor colorWithRed:233.0/255.0
                                         green:233.0/255.0
                                          blue:233.0/255.0
                                         alpha:1.0]];
    search.placeholder = @"Enter The User";
    search.frame = CGRectMake(0, 60, self.view.frame.size.width,50);
    search.delegate = self;
    search.showsBookmarkButton = NO;
    [self.view addSubview:search];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@" Active" forState:UIControlStateNormal];
    button.frame = CGRectMake(0.0, search.frame.origin.y+search.frame.size.height+1,self.view.frame.size.width, 30.0);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.backgroundColor  = [UIColor whiteColor];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont fontWithName:@"" size:18];
    
    [self.view addSubview:button];
    
  
    optionsArray = [[NSArray alloc]initWithObjects:@"UsersName", nil];
    
    table = [[UITableView alloc] initWithFrame:
             CGRectMake(0, button.frame.origin.y+button.frame.size.height+1, self.view.frame.size.width, self.view.frame.size.height-200) style:UITableViewStylePlain];
    
    table.estimatedRowHeight = 60.0f;
    table.backgroundColor = [UIColor clearColor];
    table.scrollEnabled = YES;
    [self.view addSubview:table];
    
    [table setHidden:NO];
    
    table.tag=3;
    
    
    
    table.delegate = self;
    table.dataSource = self;
    [table reloadData];
    
    
}
-(void)aMethod:(id)sender{
    
    UIButton *btn = (UIButton*)sender;
    NSLog(@"btn Tag :%ld",(long)btn.tag);
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"ACTIONSHEET" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:@"Active",@"Newest",@"Most Voted",nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@"Delete");
    }
    else if(buttonIndex == 1){
        NSLog(@"Active");
    }
    else if(buttonIndex ==2){
        NSLog(@"Karma");
    }
    else if(buttonIndex ==3){
        NSLog(@"Oldest");
    }
    //Add More Buttons Functions
    
    else {
        NSLog(@"Cancel");
    }
    
}



#pragma mark - Create Alphabet Array
/*- (void)createAlphabetArray {
    NSMutableArray *tempFirstLetterArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [dataArray count]; i++) {
        NSString *letterString = [[dataArray objectAtIndex:i] substringToIndex:1];
        if (![tempFirstLetterArray containsObject:letterString]) {
            [tempFirstLetterArray addObject:letterString];
        }
    }
    alphabetsArray = tempFirstLetterArray;
}*/

#pragma mark UITableviewDelegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    return optionsArray.count;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return alphabetsArray;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    for (int i = 0; i< [dataArray count]; i++) {
        // Here you return the name i.e. Honda,Mazda
        // and match the title for first letter of name
        // and move to that row corresponding to that indexpath as below
        NSString *letterString = [[dataArray objectAtIndex:i] substringToIndex:1];
        if ([letterString isEqualToString:title]) {
            [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
            break;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    static NSString *AutoCompleteRowIdentifier = @"AutoCompleteRowIdentifier";
    cell = [tableView dequeueReusableCellWithIdentifier:AutoCompleteRowIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AutoCompleteRowIdentifier];
    }
    cell.textLabel.font=[UIFont fontWithName:@"Abel-Regular" size:16.0f];
    
    cell.textLabel.text=[optionsArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[optionsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.textColor=[UIColor blackColor];
    cell.detailTextLabel.textColor=[UIColor whiteColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    UserProfileViewController *userProfile = [[UserProfileViewController alloc]init];
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:IPHONESTORYBOARD bundle:nil];
    userProfile = [mainStoryBoard instantiateViewControllerWithIdentifier:@"UserProfile"];
    
    [self.navigationController pushViewController:userProfile animated:YES];
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
  /*  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                    message:@"Coming Soon..."
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];*/
    
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.backgroundColor=[UIColor whiteColor];
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    return 60;
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
