//
//  QuestionAnswerViewController.m
//  TabbarViewController


#import "QuestionAnswerViewController.h"

@interface QuestionAnswerViewController ()

@end

@implementation QuestionAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
   UIImageView *bg =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    bg.image=[UIImage imageNamed:@"clearBackGround.png"];
    [self.view addSubview:bg];
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(5, 60, self.view.frame.size.width-10, 100)];
    view.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:view];
    
    UIButton *button1=[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 30, 25)];
  //  button1.backgroundColor=[UIColor redColor];
    [button1 setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
    [view addSubview:button1];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10,40 , 30, 25)];
    label.textAlignment=NSTextAlignmentCenter;
    //label.backgroundColor=[UIColor yellowColor];
    label.text=@"1";
    [view addSubview:label];
    
    UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake(10, 70, 30, 25)];
   // button2.backgroundColor=[UIColor redColor];
    [button2 setImage:[UIImage imageNamed:@"downarrow.png"] forState:UIControlStateNormal];
    [view addSubview:button2];

    
    
   
    UILabel *questions = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 300, 180)];
    NSString *text = @" Question title Goes Here ";
    questions.text = text;
    questions.textAlignment = NSTextAlignmentCenter;
    questions.lineBreakMode = NSLineBreakByWordWrapping;
    [questions setTextColor:[UIColor blueColor]];
    
    CGSize expectedLabelSize = [text sizeWithFont:questions.font
                                constrainedToSize:questions.frame.size
                                    lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect newFrame = questions.frame;
    newFrame.size.height = expectedLabelSize.height;
    questions.frame = newFrame;
    questions.numberOfLines = 0;
    [questions sizeToFit];
    //[self.view addSubview:questions];
    [view addSubview:questions];
    
    
    
     NSString *answerText = @" Here is the answer we need to show hsvaddfmnbsfdms,n jkk jhasndjkshdf njksdhfndsfmn jkkn m,dfnsjkcfhdsnf ,.mj jknfd m,dsnjkhsnc jkjhjk nknjkhfkdmsfkj kmndkdsjfm  ";
    
    CGRect textViewFrame = CGRectMake(10.0f, view.frame.origin.y+view.frame.size.height+20, self.view.frame.size.width-40.0f,self.view.frame.size.height - 300);
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    textView.alpha = 0.5;
    textView.delegate = self;
    textView.backgroundColor = [UIColor lightGrayColor];
    textView.userInteractionEnabled  = NO;
    [textView setTextColor:[UIColor whiteColor]];
    textView.text = answerText;
    [textView setFont:[UIFont boldSystemFontOfSize:15]];

    
    CGSize expectedtextViewSize = [answerText sizeWithFont:textView.font
                                         constrainedToSize:textView.frame.size
                                             lineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect Frame = textView.frame;
    Frame.size.height = expectedtextViewSize.height;
    textView.frame = Frame;
    [textView sizeToFit];

    
    
    [self.view addSubview:textView];

    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}
#pragma mark textView delegates


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"textViewShouldBeginEditing:");
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"textViewDidBeginEditing:");
    textView.backgroundColor = [UIColor greenColor];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"textViewShouldEndEditing:");
    textView.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"textViewDidEndEditing:");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
    NSUInteger location = replacementTextRange.location;
    
    if (textView.text.length + text.length > 300){
        if (location != NSNotFound){
            [textView resignFirstResponder];
        }
        return NO;
    }
    else if (location != NSNotFound){
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark textField delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"textField:shouldChangeCharactersInRange:replacementString:");
    if ([string isEqualToString:@"#"]) {
        return NO;
    }
    else {
        return YES;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn:");
    if (textField.tag == 1) {
        UITextField *passwordTextField = (UITextField *)[self.view viewWithTag:2];
        [passwordTextField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
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
