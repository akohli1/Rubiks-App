//
//  UserProfileViewController.m
//  tabbarviewcontroller
//  Created by Ayush Kohli on 7/13/15.
//  Copyright (c) 2015 Pro-tek. All rights reserved.


#import "UserProfileViewController.h"


@interface UserProfileViewController ()
{
    
    UIView *userView;
    
}

@end

@implementation UserProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"XYZ";
    self.view.backgroundColor = [UIColor colorWithRed:224.0f/255.0f green:224.0f/255.0f blue:224.0f/255.0f alpha:1.0];
    CGRect frame = CGRectMake(5.0f, 70.0f, self.view.frame.size.width-10.0f, 50);
    
    UIView *userProfilePic = [[UIView alloc] initWithFrame:frame];
    UIImage *pic = [UIImage imageNamed:@"ProfilePic.jpg"];
    UIImageView *userPic = [[UIImageView alloc]initWithImage:pic];
    userPic.frame = CGRectMake(0, 0, 50, 50);
    [userProfilePic addSubview:userPic];
    userProfilePic.backgroundColor = [UIColor lightGrayColor];
    UILabel *userDescription = [[UILabel alloc]initWithFrame:CGRectMake(userPic.frame.size.width, 0, userProfilePic.frame.size.width-userPic.frame.size.width, 50)];
    userDescription.backgroundColor = [UIColor whiteColor];
    userDescription.text = @"User Description";
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
