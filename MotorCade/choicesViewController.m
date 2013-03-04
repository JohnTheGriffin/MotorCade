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
    }else if(buttonIndex == 2){
        SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [twitter setInitialText:@"I just used MotorCade to pay my parking ticket"];
        [self presentViewController:twitter animated:YES completion:nil];
    }
    
}

@end
