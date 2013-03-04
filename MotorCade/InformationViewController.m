//
//  InformationViewController.m
//  MotorCade
//
//  Created by Griffin on 3/3/13.
//  Copyright (c) 2013 Griffin. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()
{
    UILabel *driverInfo;
    UILabel *citationInfo;
    UITextField *firstName;
    UITextField *lastName;
    UITextField *address;
    UITextField *city;
    UITextField *state;
    UITextField *zip;
    UITextField *citationNumber;
    UITextField *amountDue;
    UITextField *dueDate;
    UITextField *citationCity;
    UITextField *permanetAddress;
    UITextField *disputeAddress;
    UIButton *submit;
    
    CGPoint svc; 
}
@property (strong) IBOutlet UIScrollView *scrollView;
@end

@implementation InformationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	driverInfo = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, self.view.frame.origin.y+5, self.view.frame.size.width-10, 20)];
    [driverInfo setText:@"Driver Info"];
    [driverInfo setTextColor:[UIColor whiteColor]];
    [driverInfo setBackgroundColor:[UIColor clearColor]];
    
    firstName = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, driverInfo.frame.origin.y+30, self.view.frame.size.width-10, 30)];
    [firstName setPlaceholder:@"First Name"];
    [firstName setBorderStyle:UITextBorderStyleRoundedRect];
    [firstName setReturnKeyType:UIReturnKeyDone];
    [firstName setDelegate:self];
    
    lastName = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, firstName.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [lastName setPlaceholder:@"Last Name"];
    [lastName setBorderStyle:UITextBorderStyleRoundedRect];
    [lastName setReturnKeyType:UIReturnKeyDone];
    [lastName setDelegate:self];

    address = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, lastName.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [address setPlaceholder:@"Address"];
    [address setBorderStyle:UITextBorderStyleRoundedRect];
    [address setReturnKeyType:UIReturnKeyDone];
    [address setDelegate:self];
    
    city = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, address.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [city setPlaceholder:@"City"];
    [city setBorderStyle:UITextBorderStyleRoundedRect];
    [city setReturnKeyType:UIReturnKeyDone];
    [city setDelegate:self];
    
    state = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, city.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [state setPlaceholder:@"State"];
    [state setBorderStyle:UITextBorderStyleRoundedRect];
    [state setReturnKeyType:UIReturnKeyDone];
    [state setDelegate:self];
    
    zip = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, state.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [zip setPlaceholder:@"Address"];
    [zip setBorderStyle:UITextBorderStyleRoundedRect];
    [zip setReturnKeyType:UIReturnKeyDone];
    [zip setDelegate:self];
    
    citationInfo = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, zip.frame.origin.y+40, self.view.frame.size.width-10, 20)];
    [citationInfo setText:@"Citation Information"];
    [citationInfo setTextColor:[UIColor whiteColor]];
    [citationInfo setBackgroundColor:[UIColor clearColor]];
    
    citationNumber = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, citationInfo.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [citationNumber setPlaceholder:@"Citation Number"];
    [citationNumber setBorderStyle:UITextBorderStyleRoundedRect];
    [citationNumber setReturnKeyType:UIReturnKeyDone];
    [citationNumber setDelegate:self];
    
    amountDue = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, citationNumber.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [amountDue setPlaceholder:@"Amount Due"];
    [amountDue setBorderStyle:UITextBorderStyleRoundedRect];
    [amountDue setReturnKeyType:UIReturnKeyDone];
    [amountDue setDelegate:self];
    
    dueDate = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, amountDue.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [dueDate setPlaceholder:@"Due Date"];
    [dueDate setBorderStyle:UITextBorderStyleRoundedRect];
    [dueDate setReturnKeyType:UIReturnKeyDone];
    [dueDate setDelegate:self];
    
    citationCity = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, dueDate.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [citationCity setPlaceholder:@"Citation City"];
    [citationCity setBorderStyle:UITextBorderStyleRoundedRect];
    [citationCity setReturnKeyType:UIReturnKeyDone];
    [citationCity setDelegate:self];
    
    permanetAddress = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, citationCity.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [permanetAddress setPlaceholder:@"Permanet Address"];
    [permanetAddress setBorderStyle:UITextBorderStyleRoundedRect];
    [permanetAddress setReturnKeyType:UIReturnKeyDone];
    [permanetAddress setDelegate:self];
    
    disputeAddress = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+5, permanetAddress.frame.origin.y+40, self.view.frame.size.width-10, 30)];
    [disputeAddress setPlaceholder:@"Dispute Address"];
    [disputeAddress setBorderStyle:UITextBorderStyleRoundedRect];
    [disputeAddress setReturnKeyType:UIReturnKeyDone];
    [disputeAddress setDelegate:self];
    
    submit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submit setFrame:CGRectMake(self.view.frame.origin.x+5, disputeAddress.frame.origin.y+40, self.view.frame.size.width-10, 60)];
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    [submit setBackgroundImage:[UIImage imageNamed:@"button_loginpage_takepicture"] forState:UIControlStateNormal];
    [submit addTarget:self action:@selector(submitInfo) forControlEvents:UIControlEventTouchUpInside];

    [self.scrollView addSubview:driverInfo];
    [self.scrollView addSubview:firstName];
    [self.scrollView addSubview:lastName];
    [self.scrollView addSubview:address];
    [self.scrollView addSubview:city];
    [self.scrollView addSubview:state];
    [self.scrollView addSubview:zip];
    [self.scrollView addSubview:citationInfo];
    [self.scrollView addSubview:citationNumber];
    [self.scrollView addSubview:amountDue];
    [self.scrollView addSubview:dueDate];
    [self.scrollView addSubview:citationCity];
    [self.scrollView addSubview:permanetAddress];
    [self.scrollView addSubview:disputeAddress];
    [self.scrollView addSubview:submit];
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 640)];

}
-(void)submitInfo{
    [self performSegueWithIdentifier:@"submit" sender:self];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    svc = self.scrollView.contentOffset;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:self.scrollView];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 60;
    [self.scrollView setContentOffset:pt animated:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.scrollView setContentOffset:svc animated:YES];
    [textField resignFirstResponder];
    //[self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 560)];
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
