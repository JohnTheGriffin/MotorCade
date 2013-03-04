//
//  TicketCameraViewController.h
//  MotorCade
//
//  Created by Griffin on 3/3/13.
//  Copyright (c) 2013 Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define PICTURE_BUCKET         @"picture-bucket"

// Constants used to represent your AWS Credentials.
#define ACCESS_KEY_ID          @"AKIAJTQAXVFFZ5U7IKPQ"
#define SECRET_KEY             @"nVNF2ePlKyOr1TGRd9zwq3OlGJQ8Jhf8XA2lJdtQ"


@interface TicketCameraViewController : UIViewController <UIImagePickerControllerDelegate>

@property (nonatomic, retain) AmazonS3Client *s3;
-(IBAction)frontCamera:(id)sender;
-(IBAction)backCamera:(id)sender;

/**
 * Utility method to create a bucket name using the Access Key Id.  This will help ensure uniqueness.
 */
+(NSString *)pictureBucket;

@end
