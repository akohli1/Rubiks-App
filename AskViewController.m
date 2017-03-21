//
//  AskViewController.m
//  TabbarViewController
//
//


#import "AskViewController.h"
#import "AKTagsDefines.h"
#import "AKTagsInputView.h"

@interface AskViewController ()
{
     AKTagsInputView *_tagsInputView;
    UIView* lineView2;
}
@end

@implementation AskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:224.0f/255.0f green:224.0f/255.0f blue:224.0f/255.0f alpha:1.0];
    
    UIImageView *bg =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    bg.image=[UIImage imageNamed:@"background2.jpg"];
    [self.view addSubview:bg];
    
    CGRect frame = CGRectMake(5.0f, 70.0f, self.view.frame.size.width-10.0f, 50);

    UITextField *qustnTextField = [[UITextField alloc] initWithFrame:frame];
    qustnTextField.placeholder = @"Enter Question Title";
    qustnTextField.backgroundColor = [UIColor whiteColor];
    qustnTextField.textColor = [UIColor blackColor];
    qustnTextField.font = [UIFont systemFontOfSize:16.0f];
    
    qustnTextField.borderStyle = UITextBorderStyleNone;
    qustnTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    qustnTextField.returnKeyType = UIReturnKeyDone;
    qustnTextField.textAlignment = NSTextAlignmentLeft;
    qustnTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    qustnTextField.tag = 1;
    qustnTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    qustnTextField.delegate = self;
    qustnTextField.backgroundColor = [UIColor whiteColor];


    [self.view addSubview:qustnTextField];
    
    UIView* lineView=[[UIView alloc]initWithFrame:CGRectMake(5, qustnTextField.frame.origin.y+qustnTextField.frame.size.height+5, self.view.frame.size.width-10, 1)];
    [lineView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:lineView];
    
    CGRect textViewFrame = CGRectMake(5.0f, lineView.frame.origin.y+lineView.frame.size.height+5, self.view.frame.size.width-10.0f, 370);
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    textView.textColor = [UIColor lightGrayColor];
    textView.delegate = self;
    textView.text = @"Question body goes here...";
    textView.font = [UIFont systemFontOfSize:18.0f];
    textView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:textView];
    
    lineView2=[[UIView alloc]initWithFrame:CGRectMake(5, textView.frame.origin.y+textView.frame.size.height+5, self.view.frame.size.width-10, 1)];
    [lineView2 setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:lineView2];
    
 
    [self.view addSubview:[self createLabel]];
    [self.view addSubview:[self createTagsInputView]];
    
   
    
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clearBtn addTarget:self
                 action:@selector(aMethod:)
       forControlEvents:UIControlEventTouchUpInside];
    [clearBtn setTitle:@" Cancel" forState:UIControlStateNormal];
    clearBtn.exclusiveTouch = YES;
    clearBtn.layer.cornerRadius = 7;
    clearBtn.layer.borderWidth = 1;
    clearBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    clearBtn.frame = CGRectMake(5.0f, _tagsInputView.frame.origin.y+_tagsInputView.frame.size.height+10,100, 40.0);
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
    SubmitBtn.exclusiveTouch = YES;
    SubmitBtn.layer.cornerRadius = 7;
    SubmitBtn.layer.borderWidth = 1;
    SubmitBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    SubmitBtn.frame = CGRectMake(self.view.frame.size.width-110, _tagsInputView.frame.origin.y+_tagsInputView.frame.size.height+10,100, 40.0);
    [SubmitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    SubmitBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    SubmitBtn.backgroundColor  = [UIColor blackColor];
    SubmitBtn.titleLabel.textColor = [UIColor whiteColor];
    SubmitBtn.titleLabel.font = [UIFont fontWithName:@"" size:18];
    [self.view addSubview:SubmitBtn];

    
    
}

#pragma mark - This is what you are looking for:
-(AKTagsInputView*)createTagsInputView
{
    _tagsInputView = [[AKTagsInputView alloc] initWithFrame:CGRectMake(5, lineView2.frame.origin.y+lineView2.frame.size.height+5, self.view.frame.size.width-10.0f, 44.0f)];
    _tagsInputView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _tagsInputView.lookupTags = @[@"ios", @"iphone", @"objective-c", @"development", @"cocoa", @"xcode", @"icloud"];
    _tagsInputView.selectedTags = [NSMutableArray arrayWithArray:@[@"some", @"predefined", @"tags"]];
    _tagsInputView.enableTagsLookup = YES;
    return _tagsInputView;
}

-(UILabel*)createLabel
{
    CGRect tagsFrame = CGRectMake(5.0f, lineView2.frame.origin.y+lineView2.frame.size.height+5, self.view.frame.size.width-10.0f, 50);
    UILabel *label = [[UILabel alloc] initWithFrame:tagsFrame];;
    label.textAlignment = NSTextAlignmentLeft;
    label.text = @"TAGS";
    label.font = AVENIR_NEXT(14);
    return label;
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
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.frame = CGRectMake(0,-20,self.view.frame.size.width,self.view.frame.size.height);
     textView.text = @"";
    textView.backgroundColor = [UIColor whiteColor];
    textView.textColor=[UIColor blackColor];
    [UIView commitAnimations];
    [textView becomeFirstResponder];

}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"textViewShouldEndEditing:");
    textView.backgroundColor = [UIColor whiteColor];
     return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"textViewDidEndEditing:");
    if (textView.text==nil||[textView.text isEqualToString:@""]||[textView.text isKindOfClass:[NSNull class]]) {
        textView.text = @"Question body goes here...";
        self.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);

    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
    NSUInteger location = replacementTextRange.location;
    
    if (textView.text.length + text.length > 500){
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
  //  textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField.tag==2)
    {
        for( UIView *view in self.view.subviews)
        {
            if([view isKindOfClass:[UITextView class]])
            {
            //view.userActivity=NO;
            }
        }
            [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.frame = CGRectMake(0,-220,self.view.frame.size.width,self.view.frame.size.height);
    [UIView commitAnimations];
    }
    
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
      if(textField.tag==1)
    {
        [textField resignFirstResponder];
    }
    
    if(textField.tag==2)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.25];
        self.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
        [UIView commitAnimations];
        [textField resignFirstResponder];
    }

    return YES;
}

-(void)aMethod:(UIButton*)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
