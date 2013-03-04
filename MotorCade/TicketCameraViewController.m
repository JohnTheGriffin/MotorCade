//
//  TicketCameraViewController.m
//  MotorCade
//
//  Created by Griffin on 3/3/13.
//  Copyright (c) 2013 Griffin. All rights reserved.
//

#import "TicketCameraViewController.h"

@interface TicketCameraViewController ()
{
    IBOutlet UIButton *frontImagePicker;
    IBOutlet UIButton *backImagePicker;
    UIImagePickerController *frontPicker;
    UIImagePickerController *backPicker; 
}
@end

@implementation TicketCameraViewController

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
    // Initial the S3 Client.
    self.s3 = [[AmazonS3Client alloc] initWithAccessKey:ACCESS_KEY_ID withSecretKey:SECRET_KEY];
    
    NSLog(@"Got S3 client");
    
    // Create the picture bucket.
    
    S3CreateBucketRequest *createBucketRequest = [[S3CreateBucketRequest alloc] initWithName:[TicketCameraViewController pictureBucket]];
    NSLog(@"S3BucketRequest initialized with name: '%@'",[TicketCameraViewController pictureBucket]);
    
    S3CreateBucketResponse *createBucketResponse = [self.s3 createBucket:createBucketRequest];
    NSLog(@"S3CreateBucketResonse from createBucket");
    
    if(createBucketResponse.error != nil)
    {
        NSLog(@"Error: %@", createBucketResponse.error);
    }
    
    NSLog(@"Created S3 bucket");
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)frontCamera:(id)sender{
    frontPicker = [[UIImagePickerController alloc] init];
    
    [frontPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    
    [frontPicker setDelegate:self];
    
    [self presentViewController:frontPicker animated:YES completion:^(void){
        
    }];
}
-(IBAction)backCamera:(id)sender{
    backPicker = [[UIImagePickerController alloc] init];
    
    [backPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    
    backPicker.delegate = self;
    
    [self presentViewController:backPicker animated:YES completion:^(void){
        
    }];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    if([picker isEqual:frontPicker]){
        NSLog(@"FRONT %@", info);
        UIImage *frontImage = (UIImage *) [info objectForKey:
                       UIImagePickerControllerOriginalImage];
        NSData * data = UIImagePNGRepresentation(frontImage);
        [self uploadImage:data :@"front"];
        [frontImagePicker setImage:frontImage forState:UIControlStateNormal];
        
    }else{
        NSLog(@"Back %@", info);
        UIImage *backImage = (UIImage *) [info objectForKey:
                                           UIImagePickerControllerOriginalImage];
        NSData * data = UIImagePNGRepresentation(backImage);
        [self uploadImage:data :@"back"];
        [backImagePicker setImage:backImage forState:UIControlStateNormal];
    }
    [picker dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}

- (void)uploadImage:(NSData *)imageData :(NSString*)key
{
    
    // Upload image data.  Remember to set the content type.
    S3PutObjectRequest *por = [[S3PutObjectRequest alloc] initWithKey:key
                                                              inBucket:[TicketCameraViewController pictureBucket]];
    por.contentType = @"image/png";
    por.data        = imageData;
    
    // Put the image data into the specified s3 bucket and object.
    S3PutObjectResponse *putObjectResponse = [self.s3 putObject:por];
    [self performSelectorOnMainThread:@selector(showCheckErrorMessage:)
                           withObject:putObjectResponse.error
                        waitUntilDone:NO];
     
}

- (void)showCheckErrorMessage:(NSError *)error
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

+(NSString *)pictureBucket
{
    return [[NSString stringWithFormat:@"my-unique-name-%@%@", ACCESS_KEY_ID, PICTURE_BUCKET] lowercaseString];
}

@end
