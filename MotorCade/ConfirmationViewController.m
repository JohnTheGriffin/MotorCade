//
//  ConfirmationViewController.m
//  MotorCade
//
//  Created by Griffin on 3/3/13.
//  Copyright (c) 2013 Griffin. All rights reserved.
//

#import "ConfirmationViewController.h"

@interface ConfirmationViewController ()
{

    
}
@end

@implementation ConfirmationViewController

@synthesize firstName;
@synthesize lastName;
@synthesize cardNumber;
@synthesize cardType;
@synthesize csv;
@synthesize cardExperation;

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
    [self.cardNumber setText:self.cardNumberText];
    [self.cardExperation setText:self.cardExperationText];
    [self.csv setText:self.csvText];
    [self.firstName setText:self.firstNameText];
    [self.lastName setText:self.lastNameText];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
