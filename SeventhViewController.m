//
//  SeventhViewController.m
//  TabbarViewController
//

//


#import "SeventhViewController.h"
#import "SWRevealViewController.h"
#import  "unAnsweredViewController.h"
#define IPHONESTORYBOARD @"Main"

@interface SeventhViewController ()

@end

@implementation SeventhViewController
@synthesize optionsArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"UnAnswered";
    
   /* SWRevealViewController *revealViewController= [self revealViewController];
    [revealViewController panGestureRecognizer];
    [revealViewController panGestureRecognizer];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    UIView *lbtnView = [[UIView alloc]initWithFrame:CGRectMake(-20, 0, 100, 40)];
    UIButton *lBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lBtn setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [lBtn addTarget:revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [lBtn setFrame:CGRectMake(10, 10, 20, 15)];
    [lbtnView addSubview:lBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:lbtnView];*/
    
//    UIView *rbtnView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
//    UIButton *rBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rBtn setTitle:@"Unanswered" forState:UIControlStateNormal];
//    [rBtn addTarget:self action:@selector(unAnswered) forControlEvents:UIControlEventTouchUpInside];
//    [rBtn setFrame:CGRectMake(10, 10, 20, 15)];
//    [rbtnView addSubview:rBtn];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rbtnView];
    
    [self loadTableView];
}


-(void)unAnswered{
    
    unAnsweredViewController *unAnswered = [[unAnsweredViewController alloc]init];
    UIStoryboard *mainStoryBoard= [UIStoryboard storyboardWithName:IPHONESTORYBOARD bundle:nil];
    unAnswered = [mainStoryBoard instantiateViewControllerWithIdentifier:@"UnAnswer"];
    [self.navigationController pushViewController:unAnswered animated:YES];
    
}

-(void)loadTableView{
    
   /* UISearchBar *search = [[UISearchBar alloc] init];
    [search setTintColor:[UIColor colorWithRed:233.0/255.0
                                         green:233.0/255.0
                                          blue:233.0/255.0
                                         alpha:1.0]];
    search.placeholder = @"Enter The questions";
    search.frame = CGRectMake(0, 60, self.view.frame.size.width,50);
    search.delegate = self;
    search.showsBookmarkButton = NO;
    [self.view addSubview:search];*/
    
    /*UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Popular" forState:UIControlStateNormal];
    button.frame = CGRectMake(0.0, search.frame.origin.y+search.frame.size.height+1,self.view.frame.size.width, 30.0);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.backgroundColor  = [UIColor whiteColor];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont fontWithName:@"" size:18];
    [self.view addSubview:button];*/
                        
    
    optionsArray = [[NSArray alloc]initWithObjects:@"I have a Question", nil];
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)style:UITableViewStylePlain];
    table.estimatedRowHeight = 60.0f;
    table.backgroundColor = [UIColor clearColor];
    table.scrollEnabled = YES;
    [self.view addSubview:table];
    
    table.tag = 3;
    [table setHidden:NO];
    table.delegate = self;
    table.dataSource = self;
    [table reloadData];
    
    
}



#pragma mark UITableviewDelegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    return optionsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
    cell.backgroundColor = [UIColor colorWithRed:0.5 green:1.5 blue:4.0 alpha:1.0];
    cell.detailTextLabel.textColor=[UIColor blackColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.view endEditing:YES];
    
    unAnsweredViewController *unAnswered = [[unAnsweredViewController alloc] init];
    
    UIStoryboard* mainStoryBoard=[UIStoryboard storyboardWithName:IPHONESTORYBOARD bundle:Nil];
    unAnswered = [mainStoryBoard instantiateViewControllerWithIdentifier:@"UnAnswered"];
    
    [self.navigationController pushViewController:unAnswered animated:NO];
}


- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //  cell.backgroundColor=[UIColor colorWithRed:48.0 / 255.0 green:80.0 / 255.0blue:80.0 / 255.0 alpha:1];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    return 60;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
