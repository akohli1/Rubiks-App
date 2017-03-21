//
//  TagsQuestionsViewController.m
//  tabbarviewcontroller
//  Created by Ayush Kohli on 7/13/15.
//  Copyright (c) 2015 Pro-tek. All rights reserved.


#import "TagsQuestionsViewController.h"
#import "QuestionAnswerViewController.h"
#define IPHONESTORYBOARD @"Main"

@interface TagsQuestionsViewController ()

@end

@implementation TagsQuestionsViewController
@synthesize  optionsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadTableView];
}
-(void)loadTableView {
    
    
    
   /* UISearchBar *search = [[UISearchBar alloc] init];
    [search setTintColor:[UIColor colorWithRed:233.0/255.0
                                         green:233.0/255.0
                                          blue:233.0/255.0
                                         alpha:1.0]];
    search.placeholder = @"Enter The Question";
    search.frame = CGRectMake(0, 60, self.view.frame.size.width,50);
    search.delegate = self;
    search.showsBookmarkButton = NO;
    
    [self.view addSubview:search];*/
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@" Popular" forState:UIControlStateNormal];
    button.frame = CGRectMake(0.0, 60,self.view.frame.size.width, 30.0);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.backgroundColor  = [UIColor whiteColor];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont fontWithName:@"" size:18];
    [self.view addSubview:button];
    
    optionsArray = [[NSMutableArray alloc] initWithObjects:@"I have a Question", nil];
    
    
    table = [[UITableView alloc] initWithFrame:
             CGRectMake(0, button.frame.origin.y+button.frame.size.height+1, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    table.estimatedRowHeight = 60.0f;
    table.backgroundColor = [UIColor  clearColor];
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

#pragma TableView Delegate Methods

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
    cell.textLabel.font=[UIFont fontWithName:@"Abel-Regular" size:16.0f];
    
    cell.textLabel.text=[optionsArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[optionsArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor=[UIColor blackColor];
    cell.detailTextLabel.textColor=[UIColor blackColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.view endEditing:YES];
    QuestionAnswerViewController *targetViewController = [[QuestionAnswerViewController alloc]init];
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:IPHONESTORYBOARD bundle:nil];
    targetViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"QuestionAnswerView"];
    [self.navigationController pushViewController:targetViewController animated:YES];
    
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
