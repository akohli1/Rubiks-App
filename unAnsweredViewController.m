//
//  unAnsweredViewController.m
//  TabbarViewController
//  Created by Ayush Kohli on 7/9/15.
//  Copyright (c) 2015 Pro-tek. All rights reserved.


#import "unAnsweredViewController.h"
#import "QuestionAnswerViewController.h"
#define IPHONESTORYBOARD @"Main"

@interface unAnsweredViewController ()

@end

@implementation unAnsweredViewController
@synthesize options;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Unaswered";
    
    [self loadTableView];
    
}

-(void)loadTableView{
    
//    UISearchBar *searchBar = [[UISearchBar alloc]init];
//    [searchBar setTintColor:[UIColor colorWithRed:233.0/255.0
//                                         green:233.0/255.0
//                                          blue:233.0/255.0
//                                         alpha:1.0]];
//    searchBar.placeholder = @"Search Questions";
//    searchBar.tintColor = [UIColor clearColor];
//    searchBar.frame = CGRectMake(0, 60, self.view.frame.size.width, 60);
//    [self.view addSubview:searchBar];
   
    options = [[NSArray alloc ]initWithObjects:@"I have an unanswered question", nil];
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    return options.count;
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
    
    cell.textLabel.text=[options objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[options objectAtIndex:indexPath.row];
    cell.textLabel.textColor=[UIColor blackColor];
    cell.detailTextLabel.textColor=[UIColor blackColor];
    
    
    return cell;
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    
    QuestionAnswerViewController *qAanswerView = [[QuestionAnswerViewController alloc] init];
    
    UIStoryboard* mainStoryBoard=[UIStoryboard storyboardWithName:IPHONESTORYBOARD bundle:Nil];
    qAanswerView = [mainStoryBoard instantiateViewControllerWithIdentifier:@"QuestionAnswerView"];
    
    [self.navigationController pushViewController:qAanswerView animated:NO];
    
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
