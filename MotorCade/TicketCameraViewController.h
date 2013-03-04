//
//  TicketCameraViewController.h
//  MotorCade
//
//  Created by Griffin on 3/3/13.
//  Copyright (c) 2013 Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define PICTURE_BUCKET         @"picture-bucket"

@interface TicketCameraViewController : UIViewController <UIImagePickerControllerDelegate>

@property (nonatomic, retain) AmazonS3Client *s3;
-(IBAction)frontCamera:(id)sender;
-(IBAction)backCamera:(id)sender;
@end
