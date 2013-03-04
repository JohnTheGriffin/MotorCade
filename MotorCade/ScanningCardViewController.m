//
//  ScanningCardViewController.m
//  MotorCade
//
//  Created by Griffin on 3/3/13.
//  Copyright (c) 2013 Griffin. All rights reserved.
//

#import "ScanningCardViewController.h"
#import "ConfirmationViewController.h"

@interface ScanningCardViewController ()
{
    UIAlertView *share;
    IBOutlet UITextField *firstName;
    IBOutlet UITextField *lastName;
    IBOutlet UITextField *cardNumber;
    IBOutlet UITextField *cardType;
    IBOutlet UITextField *csvNumber;
    IBOutlet UITextField *month;
    IBOutlet UITextField *year;
}
@end

@implementation ScanningCardViewController

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
	// Do any additional setup after loading the view.
    share = [[UIAlertView alloc] initWithTitle:@"Share on Facebook or Twitter" message:@"" delegate:self cancelButtonTitle:@"No Thanks" otherButtonTitles:@"Facebook", @"Twitter", nil];
    [share setDelegate:self];
    [share show];
    [firstName setDelegate:self];
    [lastName setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        SLComposeViewController *facebook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebook setInitialText:@"I just used MotorCade to pay my parking ticket"];
        [self presentViewController:facebook animated:YES completion:nil];
        [facebook setCompletionHandler:^(SLComposeViewControllerResult result){
            CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
            
            [scanViewController setShowsFirstUseAlert:NO];
            [scanViewController setUseCardIOLogo:NO];
            scanViewController.appToken = @"de516cb5ab424b74842fd69c3ccaf50a"; // get your app token from the card.io website
            [self presentViewController:scanViewController animated:YES completion:^(void){
                
            }];
        }];
    }else if(buttonIndex == 2){
        SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [twitter setInitialText:@"I just used MotorCade to pay my parking ticket"];
        [self presentViewController:twitter animated:YES completion:nil];
        [twitter setCompletionHandler:^(SLComposeViewControllerResult result){
            CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
            
            [scanViewController setShowsFirstUseAlert:NO];
            [scanViewController setUseCardIOLogo:NO];
            scanViewController.appToken = @"de516cb5ab424b74842fd69c3ccaf50a"; // get your app token from the card.io website
            [self presentViewController:scanViewController animated:YES completion:^(void){
                
            }];
        }];
    }else{
        CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
        
        [scanViewController setShowsFirstUseAlert:NO];
        [scanViewController setUseCardIOLogo:NO];
        scanViewController.appToken = @"de516cb5ab424b74842fd69c3ccaf50a"; // get your app token from the card.io website
        [self presentViewController:scanViewController animated:YES completion:^(void){
            
        }];
    }
    
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    NSLog(@"User canceled payment info");
    // Handle user cancellation here...
    [scanViewController dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    // The full card number is available as info.cardNumber, but don't log that!
    NSLog(@"Received card info. Number: %@, expiry: %02i/%i, cvv: %@.", info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv);
    [cardNumber setText:info.redactedCardNumber];
    [month setText:[NSString stringWithFormat:@"%i", info.expiryMonth]];
    [year setText:[NSString stringWithFormat:@"%i", info.expiryYear]];
    [csvNumber setText:info.cvv];
    
    // Use the card info...
    [scanViewController dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    //[self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 560)];
    return YES;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ConfirmationViewController *control = [segue destinationViewController];
    [control setCardExperationText:[NSString stringWithFormat:@"%@/%@", month.text, year.text]];
    [control setFirstNameText:firstName.text];
    [control setLastNameText:lastName.text];
    [control setCardNumberText:cardNumber.text];
    [control setCsvText:csvNumber.text];
    
}
@end
