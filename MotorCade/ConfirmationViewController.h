//
//  ConfirmationViewController.h
//  MotorCade
//
//  Created by Griffin on 3/3/13.
//  Copyright (c) 2013 Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmationViewController : UIViewController

@property (strong) IBOutlet UILabel *firstName;
@property (strong) IBOutlet UILabel *lastName;
@property (strong) IBOutlet UILabel *cardNumber;
@property (strong) IBOutlet UILabel *cardType;
@property (strong) IBOutlet UILabel *csv;
@property (strong) IBOutlet UILabel *cardExperation;
@property (strong) IBOutlet NSString *firstNameText;
@property (strong) IBOutlet NSString *lastNameText;
@property (strong) IBOutlet NSString *cardNumberText;
@property (strong) IBOutlet NSString *cardTypeText;
@property (strong) IBOutlet NSString *csvText;
@property (strong) IBOutlet NSString *cardExperationText;

@end
