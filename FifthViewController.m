//
//  FifthViewController.m
//  TabBarController
//

//

#import "FifthViewController.h"
#import "SWRevealViewController.h"
#import "QuestionAnswerViewController.h"
#define IPHONESTORYBOARD @"Main"


@interface FifthViewController ()

@end

@implementation FifthViewController
@synthesize optionsArray;



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:224.0f/255 green:224.0f/255 blue:224.0f/255 alpha:1.0];
    self.navigationItem.title = @"Unanswered";

    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    //Add an image to your project & set that image here.
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
   /* UIView *lBtnView = [[UIView alloc] initWithFrame:CGRectMake(-20, 0, 100, 40)];
    UIButton *lBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lBtn setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [lBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [lBtn setFrame:CGRectMake(10, 10, 20, 15)];
    
    [lBtnView addSubview:lBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:lBtnView];*/

    
    
    [self loadSubView];
    
}

-(void)loadSubView{
    
    
   /* UITextView *newTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 70, self.view.frame.size.width-20, 400)];
    [newTextView setFont:[UIFont systemFontOfSize:16]];
    newTextView.text = @"Enter text here";
    newTextView.userInteractionEnabled = YES;
    [self.view addSubview:newTextView];
    
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clearBtn addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    [clearBtn setTitle:@" Cancel" forState:UIControlStateNormal];
    clearBtn.layer.cornerRadius = 10;
    clearBtn.clipsToBounds = YES;
    clearBtn.frame = CGRectMake(30, newTextView.frame.origin.y+newTextView.frame.size.height+50,100, 40.0);
    clearBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    clearBtn.backgroundColor  = [UIColor redColor];
    [clearBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   
    clearBtn.titleLabel.font = [UIFont fontWithName:@"" size:18];
    [self.view addSubview:clearBtn];

    
    UIButton *SubmitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [SubmitBtn addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    [SubmitBtn setTitle:@" Submit" forState:UIControlStateNormal];
    SubmitBtn.layer.cornerRadius = 10;
    SubmitBtn.clipsToBounds = YES;
    SubmitBtn.frame = CGRectMake(250, newTextView.frame.origin.y+newTextView.frame.size.height+50,100, 40.0);
    [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    SubmitBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    SubmitBtn.backgroundColor  = [UIColor greenColor];
    SubmitBtn.titleLabel.textColor = [UIColor whiteColor];
    SubmitBtn.titleLabel.font = [UIFont fontWithName:@"" size:18];
    [self.view addSubview:SubmitBtn];*/
    optionsArray = [[NSArray alloc]initWithObjects:@"I have an Unanswered Question", nil];
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



/*-(void)aMethod:(id)sender{
    
    
}*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [optionsArray count];
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
    cell.detailTextLabel.textColor=[UIColor blackColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
