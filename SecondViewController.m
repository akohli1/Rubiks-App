//
//  SecondViewController.m
//  TabBarController
//

#import "SecondViewController.h"
#import "SWRevealViewController.h"
#import "AskViewController.h"
#define IPHONESTORYBOARD @"Main"


@interface SecondViewController ()
{
  
    NSArray *tagsAray;
}
@end

@implementation SecondViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
     tagsAray = [[NSArray alloc] initWithObjects:@"ios", @"iphone", @"objective-c", @"development", @"cocoa", @"xcode", @"icloud",@"ios", @"iphone", @"objective-c", @"development", @"cocoa", @"xcode", @"icloud", nil];
    // Do any additional setup after loading the view from its nib.
     self.view.backgroundColor = [UIColor colorWithRed:224.0f/255 green:224.0f/255 blue:224.0f/255 alpha:1.0];
    self.navigationItem.title = @"Tags";

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

    [self loadTableView];
    
   
}





-(void)loadTableView {
    
    
    
    UISearchBar *search = [[UISearchBar alloc] init];
    [search setTintColor:[UIColor colorWithRed:233.0/255.0
                                         green:233.0/255.0
                                          blue:233.0/255.0
                                         alpha:1.0]];
    search.placeholder = @"search tags";
    search.frame = CGRectMake(0, 60, self.view.frame.size.width,50);
    search.delegate = self;
    search.showsBookmarkButton = NO;
    [self.view addSubview:search];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@" Name" forState:UIControlStateNormal];
    button.frame = CGRectMake(0.0, search.frame.origin.y+search.frame.size.height+1,self.view.frame.size.width, 30.0);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.backgroundColor  = [UIColor whiteColor];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont fontWithName:@"" size:18];
    [self.view addSubview:button];
    
    
    
    table = [[UITableView alloc] initWithFrame:
             CGRectMake(0, button.frame.origin.y+button.frame.size.height+1, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    table.estimatedRowHeight = 60.0f;
    table.backgroundColor = [UIColor clearColor];
    table.scrollEnabled = YES;
    [self.view addSubview:table];
    CGFloat height=tagsAray.count*60;
    NSLog(@"%f",height);
    table.frame=CGRectMake(0, button.frame.origin.y+button.frame.size.height+1, self.view.frame.size.width, height);
    
    table.tag=3;
    table.delegate = self;
    table.dataSource = self;
    [table reloadData];
    
}


-(void)aMethod:(id)sender{
    
    UIButton *btn = (UIButton*)sender;
    NSLog(@"btn Tag :%ld",(long)btn.tag);
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"ACTION SHEET" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:@"Popular",@"Favorite",@"name",nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@"Delete");
    }
    else if(buttonIndex == 1){
        NSLog(@"One");
    }
    else {
        NSLog(@"Cancel");
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return [tagsAray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
        UILabel *tags = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 250, 180)];
        NSString *text = [tagsAray objectAtIndex:indexPath.row];
        tags.text = text;
        tags.textAlignment = NSTextAlignmentCenter;
        tags.lineBreakMode = NSLineBreakByWordWrapping;
        [tags setTextColor:[UIColor colorWithRed:169/255 green:169/255 blue:169/255 alpha:1.0]];
        [tags setBackgroundColor:[UIColor lightGrayColor]];
        
        CGSize expectedLabelSize = [text sizeWithFont:tags.font
                                    constrainedToSize:tags.frame.size
                                        lineBreakMode:NSLineBreakByWordWrapping];
        
        CGRect newFrame = tags.frame;
        newFrame.size.height = expectedLabelSize.height;
        tags.frame = newFrame;
        tags.numberOfLines = 0;
        [tags sizeToFit];
         tags.clipsToBounds = YES;
        [[tags layer] setCornerRadius:7.0f];
        [[tags layer] setMasksToBounds:YES];
        
        [cell.contentView addSubview:tags];

        
  
    return cell;
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
if(indexPath.row%2)
{
    cell.backgroundColor=[UIColor colorWithRed:240/255.0 green:255/255.0 blue:240/255.0 alpha:1.0];
    

}

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.view endEditing:YES];
    AskViewController *askView = [[AskViewController alloc]init];
    UIStoryboard *mainStroryBoard = [UIStoryboard storyboardWithName:IPHONESTORYBOARD bundle:nil];
    askView = [mainStroryBoard instantiateViewControllerWithIdentifier:@"TagsQuestions"];
    
    [self.navigationController pushViewController:askView animated:NO];
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
