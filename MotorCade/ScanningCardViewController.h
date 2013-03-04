//
//  ScanningCardViewController.h
//  MotorCade
//
//  Created by Griffin on 3/3/13.
//  Copyright (c) 2013 Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardIO.h"
@interface ScanningCardViewController : UIViewController<UIAlertViewDelegate, CardIOPaymentViewControllerDelegate, UITextFieldDelegate>

@end
