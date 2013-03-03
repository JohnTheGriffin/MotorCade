//
//  ViewController.m
//  MotorCade
//
//  Created by Griffin on 3/2/13.
//  Copyright (c) 2013 Griffin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)activeatCardReader:(id)sender{
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    
    [scanViewController setShowsFirstUseAlert:NO];
    [scanViewController setUseCardIOLogo:NO];
    scanViewController.appToken = @"de516cb5ab424b74842fd69c3ccaf50a"; // get your app token from the card.io website
    [self presentViewController:scanViewController animated:YES completion:^(void){
        
    }]; 
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
    // Use the card info...
    [scanViewController dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}

@end
