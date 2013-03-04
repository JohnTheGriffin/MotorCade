//
//  choicesViewController.m
//  MotorCade
//
//  Created by Griffin on 3/3/13.
//  Copyright (c) 2013 Griffin. All rights reserved.
//

#import "choicesViewController.h"

@interface choicesViewController ()
{
    UIAlertView *share;
}
@end

@implementation choicesViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
